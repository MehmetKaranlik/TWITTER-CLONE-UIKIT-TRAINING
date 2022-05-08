//
//  ExploreController.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 4.05.2022.
//

import UIKit

class ExploreController: UIViewController {
   // MARK:  properties



   // MARK:  lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
       configureUI()

        // Do any additional setup after loading the view.
    }
    

    // MARK:  helpers

   private func configureUI() {
      view.backgroundColor = .white
      navigationItem.title = "Explore"

   }

}
