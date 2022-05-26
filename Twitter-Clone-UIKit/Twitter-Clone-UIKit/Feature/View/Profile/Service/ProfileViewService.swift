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
         if let _ = error {
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

   func returnUserByUID(uid: String, completion: @escaping (BaseUserModel) -> Void) {
      USERS_DB_REF.child(uid).getData { error, snapshot in
         if let _ = error {
            return
         }
         guard let dictionary = snapshot?.value as? [String:Any?] else { return}
         completion(BaseUserModel(dictionary: dictionary))
      }
   }

   func followUser(userUID: String, targetUID: String,
                   completion: @escaping (Database, Error?) -> ()) {
      let keyWindow = Utilities.returnKeyWindow()
      guard let root = keyWindow?.rootViewController as? BaseController else { return }
      root.viewModel.currentUser?.followings?.append(targetUID)
      USERS_DB_REF
         .child(userUID).child("followings").child(targetUID)
         .updateChildValues(["status":true]) { error , dbRef in
            if let _ = error {
               return
            }else {
               USERS_DB_REF .child(targetUID).child("followers")
                  .child(userUID).updateChildValues(["status":true])
            }
         }
   }
   
   func checkIsUserFollowed(targetUID: String,completion: @escaping (Bool) -> ()) {
      let keyWindow = Utilities.returnKeyWindow()
      guard let root = keyWindow?.rootViewController as? BaseController else { return}
      let condition = root.viewModel.currentUser?.followers?.contains(targetUID) ?? false
      return completion(condition)
   }
}
