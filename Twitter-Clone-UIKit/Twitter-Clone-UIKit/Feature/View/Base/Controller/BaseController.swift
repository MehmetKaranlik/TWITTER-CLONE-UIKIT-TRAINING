//
//  BaseController.swift
//  Twitter-Clone-UIKit
//  Created by mehmet karanlık on 4.05.2022.
//

import FirebaseAuth
import UIKit

protocol BaseControllerDelegate {
func actionButtonCallBack()
}

class BaseController: UITabBarController {
   // MARK: properties

   let viewModel = BaseViewModel()
   let baseView = BaseView()

   let feed = FeedController()
   let explore = ExploreController()
   let notification = NotificationController()
   let conversations = ConversationsController()


   // MARK: selectors

   

   // MARK: lifecycle

   override func viewDidLoad() {
      super.viewDidLoad()
      if viewModel.checkIfuserLoggedIn(viewController: self) {
         configureViewContoller()
         configureService()
         configureUI()
      }
   }

   // MARK: helpers

   func configureService() {
      viewModel.fetchUserInfo()
   }

    func configureViewContoller() {

      configureTabBar()

      viewControllers = populateTabController(
         images: ["home_unselected","search_unselected",
                  "like_unselected","ic_mail_outline_white_2x-1"],
         views: [feed, explore, notification, conversations])
   }

   private func configureUI() {
      view.backgroundColor = .white
      configureActionButton()
   }
   private func configureActionButton() {
      view.addSubview(baseView.actionButton)
      baseView.actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          right: view.safeAreaLayoutGuide.rightAnchor,
                          paddingBottom: 75, paddingRight: 20,
                          width: 50, height: 50)
   }

   fileprivate func configureTabBar() {
      tabBar.backgroundColor = .systemGray6.withAlphaComponent(0.45)
      tabBar.isOpaque = false
      tabBar.unselectedItemTintColor = .gray.withAlphaComponent(0.7)
      tabBar.barStyle = .black
   }


   private func populateTabController(images: [String], views: [UIViewController]) -> [UINavigationController] {
      var navigationControllers = [UINavigationController]()
      views.forEach { view in
         let navigationView = UINavigationController(rootViewController: view)
         navigationView.navigationBar.backgroundColor = .white
         navigationView.navigationBar.setValue(false, forKey: "hidesShadow")
         navigationControllers.append(navigationView)
         view.tabBarItem.image = UIImage(named: images[views.firstIndex(of: view)!])
      }
      return navigationControllers
   }
}


extension BaseController : BaseControllerDelegate {
   func actionButtonCallBack() {
      
   }

   
}
