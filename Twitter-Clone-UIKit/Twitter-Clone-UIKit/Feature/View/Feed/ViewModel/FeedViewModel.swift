//
//  FeedViewModel.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 18.05.2022.
//

import Foundation
import UIKit


class FeedViewModel : ObservableObject {

   private let service = FeedService()

   var tweets : [Tweet] = [] {
      didSet {
         reloadCollectionView()
         
      }
   }

   init() {
      fetchTweets()
   }



   func fetchTweets() {
      service.fetchTweets { [weak self] tweet in
         self?.tweets.append(tweet)
      }
   }

   func reloadCollectionView() {
      guard let keyWindow = Utilities.returnKeyWindow() else { return }
      guard let root = keyWindow.rootViewController as? BaseController else { return }
      root.feed.collectionView.reloadData()
   }

   func configureCellUponReceiveData(cell : TweetCell,index: Int) {
      let tweet = tweets.reversed()[index] as Tweet
      guard let uid = tweet.uid else { return }
      service.returnProfileImageOfTweetUser(uid) { user in
         guard let imageUrl = URL(string: user.profileImagePath ?? "") else {return }
         cell.profileImageView.sd_setImage(with: imageUrl)
         cell.headerUserInfoText
            .attributedText = NSAttributedString(
               Utilities.returnAttributedTweetHeader(fullname: user.fullname ?? "",
                                                     userName: user.username ?? "",
                                                     timeStamp: Double(tweet.timestamp?.description ?? "0") ?? 0.0)
            )

      }
         cell.captionLabel.text = tweet.caption
   }
}
