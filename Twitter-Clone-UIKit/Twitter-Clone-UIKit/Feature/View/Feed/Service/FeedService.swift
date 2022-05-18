//
//  TweetService.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 18.05.2022.
//

import Foundation
import FirebaseDatabase

struct FeedService : FeedServiceProtocol {

   var database: Database = Database.database()


   func fetchTweets(completion: @escaping (Tweet) -> Void) {

      TWEET_DB_REF.observe(.childAdded) { snapshot in
         guard let dictionary = snapshot.value as? [String:Any?] else {return}
         completion(Tweet(tweetID: snapshot.key, dictionary: dictionary))
      }


   }







}
