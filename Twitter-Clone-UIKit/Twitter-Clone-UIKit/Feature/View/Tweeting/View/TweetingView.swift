//
//  TweetingView.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 10.05.2022.
//

import Foundation
import UIKit

class TweetingView: UIView {
   // MARK: properties

   var delegate: TweetingControllerDelegate?
   // nav items
   lazy var leftNavigationButton = UIBarButtonItem(
      barButtonSystemItem: .cancel, target: self, action: #selector(handleLeftNavButton))

   lazy var tweetButton: UIButton = {
      let button = CustomButton.rounded(
         title: "Tweet", titleFont: UIFont.systemFont(ofSize: 5, weight: .bold),
         titleColor: UIColor.white, backgroundColor: UIColor.twitterBlue, cornerRadius: 15)
      button.setDimesions(width: 80, height: 30)
      return button
   }()

   lazy var tfLeftView : UIImageView = {
      let iv = UIImageView()
      iv.setDimesions(width: 42, height: 42)
      iv.backgroundColor = .red
      iv.clipsToBounds = true
      return iv
   }()

   lazy var rightNavigationButton: UIBarButtonItem = {
      let item = UIBarButtonItem()
      item.customView = tweetButton
      return item
   }()

   // regular items
   lazy var  textField : UITextField = {
      let tf = UITextField()
      tf.leftView = tfLeftView
      tf.placeholder = "What do you have your on mind?"
      return tf
   }()


   // MARK: selectors

   @objc func handleLeftNavButton() {
      delegate?.handleCancelButtonCallback()
   }

   @objc func handleTweetButton() {
      delegate?.handleTweetButtonCallback()
   }

   // MARK: init

   override init(frame: CGRect) {
      super.init(frame: frame)
      configureUI()

   }

   required init?(coder: NSCoder) {
      super.init(coder: coder)
      configureUI()
   }

   // MARK: helpers

   func configureUI() {
      configureTextField()
   }


   fileprivate func configureTextField() {
      addSubview(textField)
      textField.anchor(top:safeAreaLayoutGuide.topAnchor,
                       right: rightAnchor, left: leftAnchor,
                       paddingTop: 0,paddingRight: 0,
                       paddingLeft: 0, height: 200)
   }
}
