//
//  TweetingService.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 18.05.2022.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

struct TweetingService : TweetingServiceProtocol {
   var database: Database = FirebaseDatabase.Database.database()
   var auth: Auth = FirebaseAuth.Auth.auth()

   func uploadTweet(caption: String, completionHandler: @escaping ( Error?, DatabaseReference) -> Void) {
      guard let uid = auth.currentUser?.uid else { return }

      let dictionary : [String:Any] = ["uid": uid,
                                       "timestamp": Int(NSDate().timeIntervalSince1970),
                                       "likes":0,
                                       "retweets":0,
                                       "caption":caption]

      TWEET_DB_REF
         .childByAutoId()
         .updateChildValues(dictionary,withCompletionBlock: completionHandler)
   }


}
