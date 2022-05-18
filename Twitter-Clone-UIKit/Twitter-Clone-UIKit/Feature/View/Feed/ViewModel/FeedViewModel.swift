//
//  FeedViewModel.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 18.05.2022.
//

import Foundation


class FeedViewModel : ObservableObject {

   private let service = FeedService()

    var tweets = [Tweet]()

   init() {
      fetchTweets()
   }



   func fetchTweets() {
      service.fetchTweets { [weak self] tweets in
         self?.tweets.append(tweets)
      }
   }
}
