//
//  BaseService.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 7.05.2022.
//

import Foundation
import FirebaseAuth

struct BaseService : BaseServiceProtocol {


   var auth: Auth = Auth.auth()

   func checkUserLoggedIn() -> Bool {
      if (auth.currentUser?.uid) != nil {
         return true
      }
      return false
   }
   func fetchCurrentUserData() {
      
   }

   


}
