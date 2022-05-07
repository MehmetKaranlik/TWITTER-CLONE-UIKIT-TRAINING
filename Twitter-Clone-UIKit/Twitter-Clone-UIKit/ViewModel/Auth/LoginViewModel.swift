//
//  LoginViewModel.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 7.05.2022.
//

import Foundation
import UIKit


class LoginViewModel : ObservableObject {

   let service = LoginService()



   func loginUser(email: String? , password : String?,
                  navigationController : UINavigationController, onFail: @escaping ()->Void) {

      let breakPoint = validateUserInput(email: email, password: password)

      if breakPoint {
         service.loginUser(email: email!, password: password!) { fail in
            onFail()
         } onSuccess: { success in
            navigationController.dismiss(animated: false)
         }

      }

   }






   private func validateUserInput(email : String?, password: String?) -> Bool {
      guard let _ = email,
            let _ = password
      else { return false}
      return true

}
}
