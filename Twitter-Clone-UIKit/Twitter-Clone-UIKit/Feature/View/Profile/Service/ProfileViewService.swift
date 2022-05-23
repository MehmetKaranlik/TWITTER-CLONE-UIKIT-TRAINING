//
//  ProfileViewService.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 22.05.2022.
//

import Foundation
import FirebaseDatabase
import  FirebaseAuth


struct ProfileService : ProfileServiceProtocol {


   var database: Database = Database.database()

   var auth: Auth = Auth.auth()
   
   func fetchTweetsByUID(uid: String, completion: @escaping ([Tweet]) -> Void) {
      TWEET_DB_REF.child(uid).getData { error, snapshot in
         var tweets = [Tweet]()
         guard let tweetData = snapshot?.value as? [String:Any] else {return}
         tweetData.forEach { key, value in
            guard let dict = value as? [String:Any] else { return}
            tweets.append(Tweet(tweetID: key, dictionary: dict))

         }
         completion(tweets)
      }
   }

   func returnUserByUID(uid: String, completion: @escaping (TweetUser) -> Void) {
      USERS_DB_REF.child(uid).getData { error, snapshot in
         if let error = error {
            return
         }
         guard let dictionary = snapshot?.value as? [String:String] else { return}
         completion(TweetUser(uid: uid, dictionary: dictionary))
      }
   }

 
}
