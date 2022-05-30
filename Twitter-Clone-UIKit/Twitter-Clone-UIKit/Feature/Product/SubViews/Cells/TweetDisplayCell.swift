//
//  TweetDisplayCell.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 31.05.2022.
//

import UIKit

class TweetDisplayCell: UICollectionViewCell {
      // MARK:  properties

   let profileImageView : UIImageView = {
      let dimensionHeight = 44.0
      let iv = UIImageView()
      iv.setDimesions(width: dimensionHeight, height: dimensionHeight)
      iv.backgroundColor = .twitterBlue
      iv.layer.cornerRadius = dimensionHeight / 2
      iv.clipsToBounds = true
      return iv
   }()

   let userInfoLabel : UILabel = {
      let label = UILabel()
      label.attributedText =  NSAttributedString(Utilities.returnAttributedTweetHeader(fullname: "testname", userName: "testUsername", timeStamp: Date.now))
      return label
   }()

   let captionView : UILabel = {
      let label = UILabel()
      label.numberOfLines = 0
      label.text = "lorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem" 
      label.textColor = .black
      label.font = .preferredFont(forTextStyle: .body)
      return label
   }()

   let tweetButton : UIButton = {
      let button = CustomButton.iconButton(iconName: "comment", tintColor: UIColor.darkGray)
      button.setDimesions(width: 20, height: 20)

      return button
   }()

   let retweetButton : UIButton = {
      let button = CustomButton.iconButton(iconName: "retweet", tintColor: UIColor.darkGray)
      button.setDimesions(width: 20, height: 20)

      return button
   }()
   let likeButton : UIButton = {
      let button = CustomButton.iconButton(iconName: "like", tintColor: UIColor.darkGray)
      button.setDimesions(width: 20, height: 20)

      return button
   }()
   let shareButton : UIButton = {
      let button = CustomButton.iconButton(iconName: "share", tintColor: UIColor.darkGray)
      button.setDimesions(width: 20, height: 20)
      return button
   }()

   lazy var buttonRow : UIStackView = {
      let container = UIStackView(arrangedSubviews: [tweetButton,retweetButton,
                                                     likeButton,shareButton])
      container.axis = .horizontal
      container.distribution = .equalSpacing
      return container
   }()

      // MARK:  init

   override init(frame: CGRect) {
      super.init(frame: frame)
      configureUI()
   }

   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }




   // MARK:  helpers








   func configureUI() {
      profileImageViewConfiguration()
      userInfoLabelConfiguration()
      captionViewConfiguration()
      buttonRowConfiguration()
   }

   fileprivate func profileImageViewConfiguration() {
      addSubview(profileImageView)
      profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8,paddingLeft: 16)
   }
   fileprivate func userInfoLabelConfiguration() {
      addSubview(userInfoLabel)
      userInfoLabel.anchor(top: topAnchor, left: profileImageView.rightAnchor,
                           paddingTop: 8,paddingLeft: 8)
   }

   fileprivate func captionViewConfiguration() {
      addSubview(captionView)
      captionView.anchor(top: userInfoLabel.bottomAnchor, right: rightAnchor,
                         left: profileImageView.rightAnchor, paddingTop: 4,
                         paddingRight: 8, paddingLeft: 8)
   }

   fileprivate func buttonRowConfiguration() {
      addSubview(buttonRow)
      buttonRow.anchor( bottom: bottomAnchor, right: rightAnchor, left: leftAnchor,
                        paddingBottom: 4, paddingRight: 64, paddingLeft: 64)
   }



}
