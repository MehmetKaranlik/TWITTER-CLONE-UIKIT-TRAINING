//
//  LoginService.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 7.05.2022.
//

import Foundation
import FirebaseAuth


struct LoginService : LoginServiceProtocol {
   var auth: Auth = Auth.auth()

   func loginUser(email: String, password: String,
                  onFail: @escaping (Bool) -> Void, onSuccess: @escaping (Bool) -> Void) {
      auth.signIn(withEmail: email, password: password) { result, error in
         if let _ = error {
            onFail(false)
            return
         }
         onSuccess(true)
      }
   }


}
