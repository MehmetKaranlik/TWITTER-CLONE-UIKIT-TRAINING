//
//  BaseViewModel.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 7.05.2022.
//

import Foundation
import UIKit
import FirebaseAuth


class BaseViewModel : ObservableObject {

   let service = BaseService()
   @Published var currentUser: BaseUserModel? {
      didSet {
         passUserToFeedView()
      }
   }

   func checkIfuserLoggedIn(viewController :UIViewController) -> Bool {
      if !service.checkUserLoggedIn() {
         viewController.modalPresentationStyle = .fullScreen
         let navigationPresentation = UINavigationController(rootViewController: LoginController())
         navigationPresentation.modalPresentationStyle = .fullScreen
         DispatchQueue.main.async {
            viewController.present(navigationPresentation, animated: false)
         }
         return false
      }
      return true
   }

   func logoutUser() {
      do {
         try Auth.auth().signOut()
      } catch let error {
         print(error.localizedDescription)
      }
   }

   func fetchUserInfo() {
      service.fetchCurrentUserData { [weak self] currentUser in
         self?.currentUser = currentUser
         
      }
   }

   func passUserToFeedView() {
      guard let keyWindow = Utilities.returnKeyWindow() else { return }
      guard let root = keyWindow.rootViewController as?  BaseController else { return }
      root.feed.feedView.user = self.currentUser
   }
   
}
