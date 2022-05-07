//
//  BaseViewModel.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 7.05.2022.
//

import Foundation
import UIKit
import FirebaseAuth


class BaseViewModel {

   let service = BaseService()

   func checkIfuserLoggedIn(viewController :UIViewController) {
      if !service.checkUserLoggedIn() {
         print("calisti")
         viewController.modalPresentationStyle = .fullScreen
         let navigationPresentation = UINavigationController(rootViewController: LoginController())
         navigationPresentation.modalPresentationStyle = .fullScreen
         DispatchQueue.main.async {
            viewController.present(navigationPresentation, animated: false)
         }
      }
   }

   func LogoutUser() {
      do {
         try Auth.auth().signOut()
      } catch let error {
         print(error.localizedDescription)
      }
   }

   
}
