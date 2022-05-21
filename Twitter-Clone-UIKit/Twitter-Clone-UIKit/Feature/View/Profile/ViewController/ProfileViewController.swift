//
//  ProfileViewController.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 21.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
   // MARK:  properties
   let profileView = ProfileView()







   // MARK:  selectors

   @objc func handleBackButton() {
      navigationController?.popViewController(animated: true)
   }

   // MARK:  init

   override func viewDidLoad() {
      super.viewDidLoad()
      view = profileView
      configureNavBar()
   }


   // MARK:  helpers
   fileprivate func configureNavBar() {
      let appereance = UINavigationBarAppearance()
    //  appereance.backgroundColor = .twitterBlue
      let navBar = navigationController?.navigationBar
      navBar?.compactAppearance = appereance
      navBar?.scrollEdgeAppearance = appereance
      
   }

}
