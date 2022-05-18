//
//  TweetingServiceProtocol.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 18.05.2022.
//

import Foundation
import Firebase
import FirebaseDatabase

protocol TweetingServiceProtocol {

   var database : Database { get }
   var auth : Auth { get }

   func uploadTweet(caption : String, completionHandler : @escaping (Error?, DatabaseReference) -> Void)

}
