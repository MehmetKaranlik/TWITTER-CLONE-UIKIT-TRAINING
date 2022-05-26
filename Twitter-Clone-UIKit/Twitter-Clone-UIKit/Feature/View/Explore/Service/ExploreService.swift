//
//  ExploreService.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 25.05.2022.
//

import FirebaseAuth
import FirebaseDatabase
import Foundation

struct ExploreService: ExploreServiceProtocol {
   var database: Database = .database()

   var auth: Auth = .auth()

   func fetchUserByInput(input: String, completion: @escaping ([BaseUserModel]) -> Void) {
      var searchedUsers = [BaseUserModel]()
      USERS_DB_REF.getData { error, snapshot in
         if let _ = error {
            return
         }
         guard let snap = snapshot?.value as? [String: [String: String]] else { return }
         snap.forEach { key, value in
            guard let fullname = value["fullname"] else { return }
          
            if fullname.lowercased().contains(input.lowercased()) {
               searchedUsers.append(BaseUserModel(dictionary: value))
            }
         }
         completion(searchedUsers)
      }
      

   }
}
