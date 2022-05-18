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
      configureUI()
   }

   // MARK: helpers

   private func configureUI() {
      view = feedView
      navigationItem.leftBarButtonItem = UIBarButtonItem(customView: feedView.navigationBarImageView)
      view.backgroundColor = .white
      let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
      imageView.contentMode = .scaleAspectFit
      imageView.setDimesions(width: 44, height: 44)
      navigationItem.titleView = imageView
   }
}
