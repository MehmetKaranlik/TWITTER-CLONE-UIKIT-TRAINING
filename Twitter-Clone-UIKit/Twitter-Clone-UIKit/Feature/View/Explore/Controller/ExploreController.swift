//
//  ExploreController.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 4.05.2022.
//

import UIKit

class ExploreController: UIViewController {
   // MARK:  properties
   let exploreView = ExploreView()


   // MARK:  lifecycle

    override func viewDidLoad() {
      super.viewDidLoad()
      configureUI()
    }
    

    // MARK:  helpers

   private func configureUI() {
      view = exploreView
      configureNavBar()

   }

   func configureNavBar() {
      navigationItem.title = "Explore"
      let appereance = UINavigationBarAppearance()
      let navBar = navigationController?.navigationBar
      appereance.backgroundColor = .white
      navBar?.compactAppearance = appereance
      navBar?.scrollEdgeAppearance = appereance
   }

}
