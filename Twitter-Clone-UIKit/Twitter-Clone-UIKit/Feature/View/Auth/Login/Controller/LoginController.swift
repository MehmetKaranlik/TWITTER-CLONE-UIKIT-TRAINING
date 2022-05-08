//
//  LoginController.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 5.05.2022.
//

import UIKit

protocol LoginControllerDelegate {
   func loginButtonCallBack()
   func navigateButtonCallBack()
}

class LoginController: UIViewController {
   // MARK: properties

    let viewModel = LoginViewModel()
    let loginView = LoginView()

   // MARK: lifecycle

   // MARK: selectors
   override func loadView() {
      loginView.delegate = self
      view = loginView

   }
}


// MARK:  functions
extension LoginController : LoginControllerDelegate {
   func loginButtonCallBack() {
      loginView.activityIndicator.startAnimating()
      viewModel.loginUser(email: loginView.emailTF.text, password: loginView.passwordTF.text,
                          navigationController: self.navigationController!) { [weak self] in
            // on fail
         self?.loginView.activityIndicator.stopAnimating()
         self?.loginView.passwordTF.text  = nil

      }
   }

   func navigateButtonCallBack() {
      navigationController?.pushViewController(RegisterController(), animated: true)
   }


}
