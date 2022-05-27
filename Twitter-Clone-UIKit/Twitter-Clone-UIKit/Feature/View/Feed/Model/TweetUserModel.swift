//
//  TweetUserModel.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 19.05.2022.
//

import Foundation
import FirebaseAuth
struct TweetUser : Codable {
   let profileImagePath,uid: String?
   let fullname, email, username, password: String?
   lazy var followeds : [String]? = []
   lazy var followings : [String]? = []

   init(dictionary: [String: Any?]) {
      self.profileImagePath = dictionary["profileImagePath"] as! String?
      self.fullname = dictionary["fullname"] as! String?
      self.email = dictionary["email"] as! String?
      self.username = dictionary["username"] as! String?
      self.password = dictionary["password"] as! String?
      self.uid = dictionary["uid"] as! String?
      self.followeds = populateFolloweds(dictionary: dictionary)
      self.followings = populateFollowingsw(dictionary: dictionary)
   }


   func populateFolloweds(dictionary : [String : Any?]) -> [String] {
      var temp = [String]()

      guard let followeds = dictionary["followeds"] as? [String:Any] else {  return []}
      followeds.forEach { key, value in
         temp.append(key)
      }
      return temp
   }

   func populateFollowingsw(dictionary : [String : Any?]) -> [String] {
      var temp = [String]()
      guard let followings = dictionary["followings"] as? [String:Any?] else {  return []}
      followings.forEach { key, value in
         temp.append(key)
      }
      return temp
   }

   func isCurrentUser() -> Bool {
      return Auth.auth().currentUser?.uid == self.uid
   }
}
