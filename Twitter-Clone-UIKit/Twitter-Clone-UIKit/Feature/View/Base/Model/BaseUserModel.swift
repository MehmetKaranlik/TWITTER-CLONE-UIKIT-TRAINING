//
//  BaseUserModel.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 8.05.2022.
//

import Foundation

struct BaseUserModel: Codable {
   let profileImagePath,uid: String?
   let fullname, email, username, password: String?

   init(dictionary: [String: String?]) {
         self.profileImagePath = dictionary["profileImagePath"] ?? ""
         self.fullname = dictionary["fullname"] ?? ""
         self.email = dictionary["email"] ?? ""
         self.username = dictionary["username"] ?? ""
         self.password = dictionary["password"] ?? ""
         self.uid = dictionary["uid"] ?? ""
   }
}
