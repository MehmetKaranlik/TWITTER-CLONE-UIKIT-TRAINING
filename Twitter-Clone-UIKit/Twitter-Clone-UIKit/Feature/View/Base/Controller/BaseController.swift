//
//  BaseController.swift
//  Twitter-Clone-UIKit
//  Created by mehmet karanlık on 4.05.2022.
//

import FirebaseAuth
import UIKit

class BaseController: UITabBarController {
   // MARK: properties

   let viewModel = BaseViewModel()

   let feed = FeedController()
   let explore = ExploreController()
   let notification = NotificationController()
   let conversations = ConversationsController()

   lazy var actionButton: UIButton = {
      let button = CustomButton
                  .rounded(title: nil, titleFont: nil, titleColor: .none,
                  backgroundColor: UIColor.twitterBlue, cornerRadius: 25)
      button.setImage(UIImage(named: "new_tweet"), for: .normal)
      button.tintColor = .white
      button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
      return button
   }()

   // MARK: selectors

   @objc private func actionButtonTapped() {}

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

   fileprivate func configureTabBar() {
      tabBar.backgroundColor = .systemGray6.withAlphaComponent(0.45)
      tabBar.isOpaque = false
      tabBar.unselectedItemTintColor = .gray.withAlphaComponent(0.7)
      tabBar.barStyle = .black
   }

   private func configureUI() {
      configureActionButton()
   }

   private func configureActionButton() {
      view.addSubview(actionButton)
      actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          right: view.safeAreaLayoutGuide.rightAnchor,
                          paddingBottom: 75, paddingRight: 20,
                          width: 50, height: 50)
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
