//
//  TweetingController.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 9.05.2022.
//

import UIKit

protocol TweetingControllerDelegate : AnyObject {
   func handleCancelButtonCallback()
   func handleTweetButtonCallback()

}

class TweetingController: UIViewController {
   // MARK:  properties
   let tweetingView = TweetingView()




   // MARK:  init
    override func viewDidLoad() {
        super.viewDidLoad()
         view = tweetingView
         tweetingView.delegate = self
         configureNavBar()
    }


   // MARK:  helpers

   func configureNavBar() {
      tweetingView.backgroundColor = .white
      let appeareance = UINavigationBarAppearance()
      appeareance.backgroundColor = .white
      navigationController?.navigationBar.scrollEdgeAppearance = appeareance
      navigationItem.leftBarButtonItem = tweetingView.leftNavigationButton
      navigationItem.rightBarButtonItem = tweetingView.rightNavigationButton
   }

}


extension TweetingController : TweetingControllerDelegate {
   func handleTweetButtonCallback() {

   }

   func handleCancelButtonCallback() {
      dismiss(animated: true)
   }


}
