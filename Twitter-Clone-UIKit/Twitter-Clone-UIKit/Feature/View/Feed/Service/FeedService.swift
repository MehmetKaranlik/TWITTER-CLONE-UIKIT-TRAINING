//
//  TweetService.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 18.05.2022.
//

import FirebaseAuth
import FirebaseDatabase
import Foundation

struct FeedService: FeedServiceProtocol {
   var auth: Auth = .auth()

   var database: Database = .database()

   func fetchTweets(completion: @escaping (Tweet) -> Void) {
      TWEET_DB_REF.observe(.childAdded) { snapshot in
         guard let dictionary = snapshot.value as? [String: Any?] else { return }
         completion(Tweet(tweetID: snapshot.key, dictionary: dictionary))
      }
   }

   func returnProfileImageOfTweetUser(_ uid: String, completion : @escaping (TweetUser) -> Void) {
      USERS_DB_REF.child(uid).getData { error, snapshot in
         if let error = error {
            print("Error while loading user :  \(error)")
            return
         }
         guard let dictionary = snapshot?.value as? [String:String] else { return}
         let user = TweetUser(uid:uid,dictionary: dictionary)
         completion(user)
      }
   }
}
