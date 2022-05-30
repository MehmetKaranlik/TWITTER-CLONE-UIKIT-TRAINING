//
//  TweetDisplayHeader.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 29.05.2022.
//

import UIKit

class TweetDisplayHeader: UICollectionReusableView {
   // MARK: properties
   typealias function = () -> ()?

    var shareFunction : function? = nil
    var tweetFuntion : function?  = nil
    var likeFunction : function?  = nil
    var retweetFunction : function? = nil


   let profileImageView: UIImageView = {
      let circleDimension = 60.0
      let iv = UIImageView()
      iv.setDimesions(width: circleDimension, height: circleDimension)
      iv.contentMode = .scaleAspectFill
      iv.layer.cornerRadius = circleDimension / 2
      iv.clipsToBounds = true
      iv.backgroundColor = .twitterBlue
      return iv
   }()

   let fullnameText: UILabel = {
      let label = UILabel()
      label.text = "Test"
      label.textColor = .black
      label.font = .boldSystemFont(ofSize: 16)
      return label
   }()

   let userNameText: UILabel = {
      let label = UILabel()
      label.text = "@testuser"
      label.font = .systemFont(ofSize: 14)
      label.textColor = .lightGray
      return label
   }()

   let captionView: UILabel = {
      let cv = UILabel()
      cv.text = """
      This test text about seeing if its gonna break down this lines, hopefully yes ! 😜
      """
      cv.numberOfLines = 0
      cv.textColor = .black
      cv.font = .systemFont(ofSize: 17, weight: .regular)
      return cv
   }()

   let date: UILabel = {
      let label = UILabel()
      label.text = "2:03 PM 01/08/2020"
      label.textColor = .lightGray
      label.font = .systemFont(ofSize: 14)
      return label
   }()

   let tweetMetaDataLabel = Like_Retweet_LabelView(likeCount: 5, retweetCount: 3)

   // MARK: init

   override init(frame: CGRect) {
      super.init(frame: frame)
      configureUI()
   }

   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   let tweetButton : UIButton = {
      let button = CustomButton.iconButton(iconName: "comment", tintColor: UIColor.darkGray)
      button.setDimesions(width: 24, height: 24)
      button.addTarget(self, action: #selector(handleTweetButton(_:)), for: .touchUpInside)
      return button
   }()
   let retweetButton : UIButton = {
      let button = CustomButton.iconButton(iconName: "retweet", tintColor: UIColor.darkGray)
      button.setDimesions(width: 24, height: 24)
      button.addTarget(self, action: #selector(handleRetweetButton(_:)), for: .touchUpInside)

      return button
   }()
   let likeButton : UIButton = {
      let button = CustomButton.iconButton(iconName: "like", tintColor: UIColor.darkGray)
      button.setDimesions(width: 24, height: 24)
      button.addTarget(self, action: #selector(handleLikeButton(_:)), for: .touchUpInside)

      return button
   }()
   let shareButton : UIButton = {
      let button = CustomButton.iconButton(iconName: "share", tintColor: UIColor.darkGray)
      button.setDimesions(width: 24, height: 24)
      button.addTarget(self, action: #selector(handleShareButton(_:)), for: .touchUpInside)

      return button
   }()


   lazy var buttonContainer : UIStackView = {
      let sv = UIStackView(arrangedSubviews: [tweetButton,retweetButton,likeButton,shareButton])
      sv.distribution = .equalSpacing
      sv.axis = .horizontal
      return sv
   }()



   override var intrinsicContentSize: CGSize {
      return CGSize(width: frame.width, height: 1000)
   }

   // MARK: helpers




   private func configureUI() {
      profileImageConfiguration()
      fullnameTextConfiguration()
      userNameConfiguration()
      captionTextConfiguration()
      buttonContainerConfiguration()
      tweetMetaDataLabelConfiguration()
      dateConfiguration()
   }

   fileprivate func profileImageConfiguration() {
      addSubview(profileImageView)
      profileImageView.anchor(top: topAnchor, left: leftAnchor,
                              paddingTop: 8, paddingLeft: 8)
   }

   fileprivate func fullnameTextConfiguration() {
      addSubview(fullnameText)
      fullnameText.anchor(top: profileImageView.topAnchor,
                          left: profileImageView.rightAnchor, paddingLeft: 8)
   }

   fileprivate func userNameConfiguration() {
      addSubview(userNameText)
      userNameText.anchor(top: fullnameText.bottomAnchor,
                          left: fullnameText.leftAnchor, paddingTop: 4)
   }

   fileprivate func captionTextConfiguration() {
      addSubview(captionView)
      captionView.anchor(top: profileImageView.bottomAnchor,

                         right: rightAnchor,
                         left: leftAnchor, paddingTop: 8, paddingRight: 16, paddingLeft: 16)
   }

   fileprivate func tweetMetaDataLabelConfiguration() {
      addSubview(tweetMetaDataLabel)
      tweetMetaDataLabel.anchor(bottom: buttonContainer.topAnchor, left: leftAnchor,
                                paddingBottom: 4, paddingLeft: 16)
   }

   fileprivate func buttonContainerConfiguration() {
      addSubview(buttonContainer)
      buttonContainer.anchor( bottom: self.bottomAnchor, right: rightAnchor,
                              left: leftAnchor,paddingBottom: 4, paddingRight:  24 ,paddingLeft: 24)
      buttonContainer.heightAnchor.constraint(equalToConstant: 24).isActive = true
   }

   fileprivate func dateConfiguration() {
      addSubview(date)
      date.anchor( bottom: tweetMetaDataLabel.topAnchor,
                   left: tweetMetaDataLabel.leftAnchor,paddingBottom: 4)
   }



}

// MARK:  selectors
extension TweetDisplayHeader {
   @objc func handleTweetButton(_ : UIButton) {
      tweetFuntion  == nil ? nil : tweetFuntion!()
   }
   @objc func handleRetweetButton(_ : UIButton) {
      retweetFunction  == nil ? nil : retweetFunction!()
   }
   @objc func handleLikeButton(_ : UIButton) {
      likeFunction  == nil ? nil : likeFunction!()
   }
   @objc func handleShareButton(_ : UIButton) {
      shareFunction  == nil ? nil : shareFunction!()
   }
}
