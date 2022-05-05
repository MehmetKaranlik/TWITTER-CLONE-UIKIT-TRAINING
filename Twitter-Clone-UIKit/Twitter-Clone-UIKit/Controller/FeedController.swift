   //
   //  FeedController.swift
   //  Twitter-Clone-UIKit
   //
   //  Created by mehmet karanlık on 4.05.2022.
   //

import UIKit

class FeedController: UIViewController {
      // MARK:  properties



      // MARK:  lifecycle

   override func viewDidLoad() {
      super.viewDidLoad()
      configureUI()
   }


      // MARK:  helpers

  private func configureUI() {
      view.backgroundColor = .white
      let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
      imageView.contentMode = .scaleAspectFit
      navigationItem.titleView = imageView
   }

}
