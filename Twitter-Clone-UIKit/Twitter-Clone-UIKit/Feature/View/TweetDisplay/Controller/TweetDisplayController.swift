//
//  TweetDisplayController.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 29.05.2022.
//

import UIKit

class TweetDisplayController: UIViewController {
   // MARK:  properties

   var tweetOwner : String? = nil

   lazy var tweetDisplayView = TweetDisplayView()
   let tweet : Tweet

   init(tweet : Tweet) {
      self.tweet = tweet
      super.init(nibName: nil, bundle: nil)
   }

   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   

   // MARK:  init
    override func viewDidLoad() {
        super.viewDidLoad()
       configureController()
       configureUI()
    }





    
   // MARK:  helpers
   func configureUI() {
   view = tweetDisplayView
   }


   func configureController() {
      configureNavigationBar()
   }

   func configureNavigationBar() {
      navigationItem.title = tweetOwner ?? ""
   }


}
