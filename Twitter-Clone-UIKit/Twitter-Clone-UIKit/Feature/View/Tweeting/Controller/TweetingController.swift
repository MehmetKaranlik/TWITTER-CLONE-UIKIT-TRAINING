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
   let tweetingViewModel = TweetingViewModel()




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
      tweetingView.loadingView.isHidden = false

      tweetingViewModel
         .uploadTweet(caption: tweetingView.captionTextView.text) { [weak self] bool in
         if bool {
            print(bool)
            self?.tweetingView.loadingView.isHidden = true
            self?.dismiss(animated: true)
         }else {
            self?.tweetingView.loadingView.isHidden = true
         }
      }

   }

   func handleCancelButtonCallback() {
      dismiss(animated: true)
   }


}
