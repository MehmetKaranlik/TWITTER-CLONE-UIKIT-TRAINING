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

   var user: BaseUserModel? {
      didSet {
         service.fetchTweetsByUID(uid: user?.uid ?? "") { [weak self] tweets in
            self?.tweets = tweets
            self?.sortTweets()
         }
      }
   }

   init() {}

   func configureUserUponData(headerView: ProfileViewHeader, user: BaseUserModel) {
      guard let url = URL(string: user.profileImagePath ?? "") else { return }
      headerView.profileImageView.sd_setImage(with: url)
      headerView.userTag.text = "@\(user.username ?? "")"
      headerView.userName.text = user.fullname
      setFollowerFollowings(headerView, user)
      checkIsUserFollowed(targetUID: user.uid ?? "") { value in
         headerView.editProfileButton
            .setTitle(user.isCurrentUser ? "Edit Profile" :
               value ? "Unfollow" : " Follow", for: .normal)
      }
   }

   func configureCellUponData(cell: TweetCell, tweet: Tweet) {
      cell.captionLabel.text = tweet.caption
      service.returnUserByUID(uid: user?.uid ?? "") { user in
         cell.headerUserInfoText
            .attributedText = NSAttributedString(Utilities.returnAttributedTweetHeader(
               fullname: user.fullname ?? "", userName: user.username ?? "",
               timeStamp: tweet.timestamp ?? Date.now))
         guard let url = URL(string: user.profileImagePath!) else { return }
         cell.profileImageView.sd_setImage(with: url)
      }
   }

   fileprivate func sortTweets() {
      tweets?.sort(by: { tweet1, tweet2 in
         tweet1.timestamp! > tweet2.timestamp!
      }
      )
   }

   func checkIsUserFollowed(targetUID: String, completion: @escaping (Bool) -> ()) {
      let keyWindow = Utilities.returnKeyWindow()
      guard let root = keyWindow?.rootViewController as? BaseController else { return }
      let condition = root.viewModel.currentUser?.followings?.contains(targetUID)
      return completion(condition!)
   }

   func followUser(targetUserUID: String) {
      guard let uid = Auth.auth().currentUser?.uid else { return }

      let keyWindow = Utilities.returnKeyWindow()

      guard let root = keyWindow?.rootViewController as? BaseController else { return }

      let condition = root.viewModel.currentUser?.followings?.contains(targetUserUID) ?? false

      if !condition {
         service.followUser(userUID: uid,
                            targetUID: targetUserUID) { _, error in if let _ = error { return }}
      } else {
         service.unfollowUser(userUID: uid, targetUID: targetUserUID)
      }
   }

   fileprivate func setFollowerFollowings(_ headerView: ProfileViewHeader, _ user: BaseUserModel) {
      let label = headerView.following_followers_label
      label.folllowingText.attributedText = label
         .populateAttributedString(user.followings?.count.description ?? "33", "following")
      label.followerCount = user.followers?.count ?? 0
      label.followerText.attributedText = label
         .populateAttributedString(user.followers?.count.description ?? "33", "followers")
      label.followedCount = user.followings?.count ?? 0
   }

   
}
