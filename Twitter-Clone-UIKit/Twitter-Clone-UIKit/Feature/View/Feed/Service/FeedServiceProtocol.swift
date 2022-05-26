//
//  FeedServiceProtocol.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 18.05.2022.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth


protocol FeedServiceProtocol {

   var database : Database { get }
   var auth : Auth { get }
   func fetchTweets(completion : @escaping (Tweet)-> Void)

   func returnProfileImageOfTweetUser(_ uid : String, completion : @escaping (BaseUserModel) -> Void)
}
