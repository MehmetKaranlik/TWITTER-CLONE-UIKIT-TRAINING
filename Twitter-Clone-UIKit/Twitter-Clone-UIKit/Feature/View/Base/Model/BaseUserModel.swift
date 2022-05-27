//
//  BaseUserModel.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 8.05.2022.
//

import Foundation
import FirebaseAuth

struct BaseUserModel: Codable {
   let profileImagePath,uid: String?
   let fullname, email, username, password: String?
   var followers : [String]? = []
   var followings : [String]? = []

   init(dictionary: [String: Any?]) {
         self.profileImagePath = dictionary["profileImagePath"] as! String?
         self.fullname = dictionary["fullname"] as! String?
         self.email = dictionary["email"] as! String?
         self.username = dictionary["username"] as! String?
         self.password = dictionary["password"] as! String?
         self.uid = dictionary["uid"] as! String?
         self.followers = populateFollowers(dictionary: dictionary)
         self.followings = populateFollowings(dictionary: dictionary)
   }


   func populateFollowers(dictionary : [String : Any?]) -> [String] {
      var temp = [String]()

      guard let followers = dictionary["followers"] as? [String:Any] else {  return []}
      followers.forEach { key, value in
         temp.append(key)
      }
      return temp
   }

   func populateFollowings(dictionary : [String : Any?]) -> [String] {
      var temp = [String]()
      if let followings = dictionary["followings"] as? [String:Any] {
         followings.forEach { key,value in
            temp.append(key)
         }
      }
      return temp
   }

   var isCurrentUser : Bool {
      return Auth.auth().currentUser?.uid == self.uid
   }
}
