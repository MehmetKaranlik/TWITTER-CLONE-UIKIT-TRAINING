   //
   //  RegisterViewModel.swift
   //  Twitter-Clone-UIKit
   //
   //  Created by mehmet karanlık on 6.05.2022.
   //

import Foundation
import UIKit


class RegisterViewModel : ObservableObject {
      // MARK:  properties
   let service = RegisterService()
   var profileImage: UIImage?

   init(){}



      // MARK:  functions

   func registerButtonCallBack(email: String?, password:String?,
                               fullname: String?, userName: String?) {
      let validate = validateUserInput(email: email, password: password,
                                         fullname: fullname, userName: userName)
      if validate {
         service.registerUser(email: email!, password: password!,
                              fullname: fullname!, username: userName!, userImage: profileImage)
      }
   }


   private func validateUserInput(email: String?, password:String?,
                          fullname: String?, userName: String?) -> Bool {
      if email != nil && password != nil
      && fullname != nil && userName != nil {
         return true
      }
      return false
   }

}
