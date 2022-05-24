//
//  FeedController.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 4.05.2022.
//

import UIKit




class FeedController: UIViewController {
   // MARK: properties

   let feedView = FeedView()
   let viewModel = FeedViewModel()

   // MARK: lifecycle

   override func viewDidLoad() {
      super.viewDidLoad()
      loadViewIfNeeded()
      feedView.viewModel = viewModel
      configureUI()
   }

   override func viewDidAppear(_ animated: Bool) {
      navigationController?.navigationBar.isHidden = false
   }

   // MARK: helpers



   private func configureUI() {
      view = feedView
      configureNavBar()
   }

   fileprivate func configureNavBar() {
      let appereance = UINavigationBarAppearance()
      let navBar = navigationController?.navigationBar
      appereance.backgroundColor = .white
      navBar?.compactAppearance = appereance
      navBar?.scrollEdgeAppearance = appereance
      configureNavigationItemView()

   }

   fileprivate func configureNavigationItemView() {
      navigationItem.leftBarButtonItem = UIBarButtonItem(customView: feedView.navigationBarImageView)
      view.backgroundColor = .white
      let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
      imageView.contentMode = .scaleAspectFit
      imageView.setDimesions(width: 44, height: 44)
      navigationItem.titleView = imageView
   }
}

