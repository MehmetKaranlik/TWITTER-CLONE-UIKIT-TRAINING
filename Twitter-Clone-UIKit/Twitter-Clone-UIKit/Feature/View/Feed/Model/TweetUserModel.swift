//
//  TweetUserModel.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 19.05.2022.
//

import Foundation

struct TweetUser : Codable {
   let email, fullname, password,profileImagePath,username : String?

   init(dictionary: [ String: String]) {
      self.email = dictionary["email"]
      self.fullname = dictionary["fullname"]
      self.password = dictionary["password"]
      self.profileImagePath = dictionary["profileImagePath"]
      self.username = dictionary["username"]
   }
}
