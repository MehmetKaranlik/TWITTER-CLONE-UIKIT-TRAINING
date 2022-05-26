//
//  ProfileViewServiceProtocol.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 22.05.2022.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

protocol ProfileServiceProtocol {
   var database : Database { get }
   var auth : Auth { get }
   func fetchTweetsByUID(uid : String, completion : @escaping ([Tweet]) -> Void)
   func returnUserByUID(uid: String,completion : @escaping (TweetUser) -> Void)
   func followUser(userUID:String, targetUID: String,
                   completion : @escaping (Database,Error?) -> ())

   func checkIsUserFollowed(targetUID: String,completion: @escaping (Bool) -> ())
}
