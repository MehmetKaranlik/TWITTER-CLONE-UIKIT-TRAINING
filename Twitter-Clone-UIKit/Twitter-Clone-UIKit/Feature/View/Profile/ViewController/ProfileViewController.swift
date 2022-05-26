//
//  ProfileViewController.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 21.05.2022.
//

import UIKit

private let headerID = "reuseHeader"
private let cellID = "TweetCell"

protocol ProfileCollectionHeaderDelegate: AnyObject {
   func handleBackButtonTap()
   func handleFollowButtonTap()
}

class ProfileViewController: UIViewController {
   // MARK: properties

   lazy var profileView = ProfileView(viewModel: viewModel)
   let viewModel = ProfileViewModel()

   // MARK: selectors

   @objc func handleBackButton() {
      navigationController?.popViewController(animated: true)
   }

   // MARK: init

   override func viewDidLoad() {
      super.viewDidLoad()
     // configureCollectionView()

      configureNavBar()
      view = profileView
   }

   override func viewDidAppear(_ animated: Bool) {
      profileView.collectionView.reloadData()
   }

   // MARK: helpers

 
   fileprivate func configureNavBar() {
      let appereance = UINavigationBarAppearance()
      let navBar = navigationController?.navigationBar
      navBar?.compactAppearance = appereance
      navBar?.isHidden = true
      navBar?.scrollEdgeAppearance = appereance
   }
}




