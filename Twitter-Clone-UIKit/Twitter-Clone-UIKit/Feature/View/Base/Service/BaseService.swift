//
//  BaseService.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 7.05.2022.
//

import FirebaseAuth
import FirebaseDatabase
import Foundation

struct BaseService: BaseServiceProtocol {




   var database: Database = .database()
   var auth: Auth = .auth()

   func checkUserLoggedIn() -> Bool {
      if (auth.currentUser?.uid) != nil {
         return true
      }
      return false
   }

    func fetchCurrentUserData(completionHandler: @escaping (BaseUserModel) -> Void ) {
      guard let uid = auth.currentUser?.uid else { return }
      USERS_DB_REF.child(uid).observeSingleEvent(of: .value) {  snapshot in
         guard var dictionary = snapshot.value as? [String: Any?] else { return }
         dictionary["uid"] = uid
         let user = BaseUserModel(dictionary: dictionary)
         completionHandler(user)
      }
   }
}
