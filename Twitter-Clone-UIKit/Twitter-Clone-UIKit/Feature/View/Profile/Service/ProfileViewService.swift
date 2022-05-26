//
//  ProfileViewService.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 22.05.2022.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth


struct ProfileService : ProfileServiceProtocol {


   var database: Database = FirebaseDatabase.Database.database()

   var auth: Auth = Auth.auth()
   
   func fetchTweetsByUID(uid: String, completion: @escaping ([Tweet]) -> Void) {
      var tweets = [Tweet]()
      TWEET_DB_REF.getData { error, snapshot in
         if let error = error {
            print("Something went wrong with fetching tweets : \(error)")
            return
         }
         guard let tweetData = snapshot?.value as? [String:Any] else { return }
         tweetData.forEach { key,value in
            guard let dict = value as? [String:Any] else { return }
            if dict["uid"] as? String == uid {
               tweets.append(Tweet(tweetID: key, dictionary: dict))
            }
         }
         completion(tweets)
      }
   }

   func returnUserByUID(uid: String, completion: @escaping (TweetUser) -> Void) {
      USERS_DB_REF.child(uid).getData { error, snapshot in
         if let _ = error {
            return
         }
         guard let dictionary = snapshot?.value as? [String:String] else { return}
         completion(TweetUser(uid: uid, dictionary: dictionary))
      }
   }

   func followUser(userUID: String, targetUID: String,
                   completion: @escaping (Database, Error?) -> ()) {

      USER_FOLLOWING_DB.child(userUID).updateChildValues(["uid":targetUID]) { error , dbRef in
         if let  _ = error {
            print(error)
            return
         }
         USER_FOLLOWERS_DB.child(targetUID).updateChildValues(["uid": userUID]) { error, dbRef in
            if let _ = error {
               print(error)
               return
            }
         }
      }
   }
   
 
}
