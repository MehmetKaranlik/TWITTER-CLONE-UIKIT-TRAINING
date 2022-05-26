//
//  ProfileViewModel.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 22.05.2022.
//

import FirebaseAuth
import Foundation
import UIKit
class ProfileViewModel {
   let service = ProfileService()
   var tweets: [Tweet]? {
      didSet {}
   }

   var selectedFilterIndex = 0

   var user: TweetUser? {
      didSet {
         service.fetchTweetsByUID(uid: user?.uid ?? "") { [weak self] tweets in
            self?.tweets = tweets
            self?.sortTweets()
         }
      }
   }

   init() {}

   func configureUserUponData(headerView: ProfileViewHeader, user: TweetUser) {
      guard let url = URL(string: user.profileImagePath ?? "") else { return }
      headerView.profileImageView.sd_setImage(with: url)
      headerView.userTag.text = "@\(user.username ?? "")"
      headerView.userName.text = user.fullname
      headerView.editProfileButton
         .setTitle(user.isCurrentUser() ? "Edit Profile" : "Follow", for: .normal)
   }

   func configureCellUponData(cell: TweetCell, tweet: Tweet) {
      cell.captionLabel.text = tweet.caption
      service.returnUserByUID(uid: user?.uid ?? "") { user in
         cell.headerUserInfoText
            .attributedText = NSAttributedString(Utilities.returnAttributedTweetHeader(
               fullname: user.fullname ?? "", userName: user.username ?? "",
               timeStamp: tweet.timestamp ?? Date.now))
         guard let url = URL(string: user.profileImagePath ?? "") else { return }
         cell.profileImageView.sd_setImage(with: url)
      }
   }

   fileprivate func sortTweets() {
      tweets?.sort(by: { tweet1, tweet2 in
         tweet1.timestamp! > tweet2.timestamp!
      }
      )
   }


   func followUser(targetUserUID : String )  {
      guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
      service.followUser(userUID: currentUserUID, targetUID: targetUserUID) { db, error in
         if let _  =  error {
            print("something went wrong with following user \(error)")
            return
         }
         print("targetFollowed")
      }
   }
}
