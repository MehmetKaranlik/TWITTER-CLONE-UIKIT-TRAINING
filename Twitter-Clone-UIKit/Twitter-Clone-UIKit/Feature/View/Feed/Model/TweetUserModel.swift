//
//  TweetUserModel.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 19.05.2022.
//

import Foundation
import FirebaseAuth
struct TweetUser : Codable {
   let email, fullname, password,profileImagePath,username,uid : String?

   init(uid:String,dictionary: [ String: String]) {
      self.email = dictionary["email"]
      self.fullname = dictionary["fullname"]
      self.password = dictionary["password"]
      self.profileImagePath = dictionary["profileImagePath"]
      self.username = dictionary["username"]
      self.uid = uid
   }

   func isCurrentUser() -> Bool {
      return Auth.auth().currentUser?.uid == self.uid
   }
}
