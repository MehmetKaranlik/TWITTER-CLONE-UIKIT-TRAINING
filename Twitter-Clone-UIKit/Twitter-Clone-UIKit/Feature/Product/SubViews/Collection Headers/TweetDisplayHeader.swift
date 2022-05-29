//
//  TweetDisplayHeader.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 29.05.2022.
//

import UIKit

class TweetDisplayHeader: UICollectionReusableView {
   // MARK: properties

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

   let captionView: UITextView = {
      let cv = UITextView()
      cv.text = """
      This test text about seeing if its gonna break down this lines, hopefully yes ! 😜
      """
      cv.textContainer.maximumNumberOfLines = 0
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
      super.init(coder: coder)
   }

   override var intrinsicContentSize: CGSize {
      return CGSize(width: frame.width, height: 300)
   }

   // MARK: helpers

   private func configureUI() {
      profileImageConfiguration()
      fullnameTextConfiguration()
      userNameConfiguration()
      captionTextConfiguration()
      tweetMetaDataLabelConfiguration()
      addSubview(date)
      date.anchor(bottom: tweetMetaDataLabel.topAnchor, left: leftAnchor,
                  paddingBottom: 4, paddingLeft: 16)
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
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         left: leftAnchor, paddingTop: 8, paddingRight: 8, paddingLeft: 8)
   }

   fileprivate func tweetMetaDataLabelConfiguration() {
      addSubview(tweetMetaDataLabel)
      tweetMetaDataLabel.anchor(bottom: bottomAnchor, left: leftAnchor,
                                paddingBottom: 4, paddingLeft: 16)
   }
}
