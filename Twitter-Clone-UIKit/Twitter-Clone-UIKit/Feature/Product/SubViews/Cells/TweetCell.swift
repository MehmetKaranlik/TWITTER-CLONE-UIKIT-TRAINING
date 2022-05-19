//
//  TweetCell.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 19.05.2022.
//

import Foundation
import UIKit

class TweetCell: UICollectionViewCell {
   // MARK: properties



    var delegate : TweetCellDelegate?

   let profileImageView: UIImageView = {
      let iv = UIImageView()
      iv.setDimesions(width: 60, height: 60)
      iv.layer.cornerRadius = 60 / 2
      iv.clipsToBounds = true
      iv.backgroundColor = .twitterBlue
      return iv
   }()

   let headerUserInfoText: UILabel = {
      let label = UILabel()
      let attributedString = NSAttributedString(
         string: "Eddie Brock",
         attributes: [NSAttributedString.Key.foregroundColor: UIColor.black,
                      NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
      let attributedString2 = NSAttributedString(
         string: " @eddie 3h",
         attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
      var completeAttributedString = AttributedString(attributedString)
      completeAttributedString.append(AttributedString(attributedString2))
      label.attributedText = NSAttributedString(completeAttributedString)
      return label
   }()

   let captionLabel: UILabel = {
      let label = UILabel()
      label.font = .systemFont(ofSize: 14)
      label.numberOfLines = 0
      label.text = "some caption label"
      return label
   }()

   let seperatorView: UIView = {
      let view = UIView()
      view.heightAnchor.constraint(equalToConstant: 0.75).isActive = true
      view.backgroundColor = .systemGroupedBackground
      return view
   }()

   lazy var commentButton : UIButton = {
      let button = UIButton()
      button.setImage(UIImage(named: "comment"), for: .normal)
      button.setDimesions(width: 20, height: 20)
      button.tintColor = .darkGray
      button.addTarget(self, action:  #selector(handleCommentButton(_:)), for: .touchUpInside)
      return button
   }()
   lazy var retweetButton : UIButton = {
      let button = UIButton()
      button.setImage(UIImage(named: "retweet"), for: .normal)
      button.setDimesions(width: 20, height: 20)
      button.tintColor = .darkGray
      button.addTarget(self, action:  #selector(handleRetweetButton(_:)), for: .touchUpInside)

      return button
   }()
   lazy var likeButton : UIButton = {
      let button = UIButton()
      button.setImage(UIImage(named: "like"), for: .normal)
      button.setDimesions(width: 20, height: 20)
      button.tintColor = .darkGray
      button.addTarget(self, action:  #selector(handleLikeButton(_:)), for: .touchUpInside)

      return button
   }()
   lazy var shareButton : UIButton = {
      let button = UIButton()
      button.setImage(UIImage(named: "share"), for: .normal)
      button.setDimesions(width: 20, height: 20)
      button.tintColor = .darkGray
      button.addTarget(self, action:  #selector(handleShareButton(_:)), for: .touchUpInside)

      return button
   }()

   lazy var buttonRow : UIStackView = {
      let stack = UIStackView(arrangedSubviews: [
         commentButton,retweetButton,likeButton,shareButton
      ])
      stack.axis = .horizontal
      stack.distribution = .equalSpacing
      return stack
   }()


   // MARK:  selectors


   @objc func handleCommentButton(_ sender : UIButton) {
      delegate?.handleCommentButton()
   }
   @objc func handleRetweetButton(_ sender : UIButton) {
      delegate?.handleRetweetButton()
   }
   @objc func handleLikeButton(_ sender : UIButton) {
      delegate?.handleLikeButton()
   }
   @objc func handleShareButton(_ sender : UIButton) {
      delegate?.handleShareButton()
   }
   

   // MARK: init

   override init(frame: CGRect) {
      super.init(frame: frame)
      configureUI()
   }

   @available(*, unavailable)
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   // MARK: helpers

   fileprivate func configureUI() {
      configureProfileImage()
      configureHeaderUserInfoText()
      configureCaptionLabel()
      configureSeparatorView()
      addSubview(buttonRow)
      buttonRow.anchor(bottom: seperatorView.topAnchor, right: self.rightAnchor,
                       left: self.leftAnchor, paddingBottom: 8,
                       paddingRight: 64, paddingLeft: 64)
   }

   fileprivate func configureProfileImage() {
      addSubview(profileImageView)
      profileImageView.anchor(top: topAnchor, left: leftAnchor,
                              paddingTop: 10, paddingLeft: 10)
   }

   fileprivate func configureHeaderUserInfoText() {
      addSubview(headerUserInfoText)
      headerUserInfoText.anchor(top: topAnchor, left: profileImageView.rightAnchor,
                                paddingTop: 10, paddingLeft: 10)
   }

   fileprivate func configureCaptionLabel() {
      addSubview(captionLabel)
      captionLabel.anchor(top: headerUserInfoText.bottomAnchor,
                          left: profileImageView.rightAnchor,
                          paddingTop: 4, paddingLeft: 10)
   }

   fileprivate func configureSeparatorView() {
      addSubview(seperatorView)
      seperatorView.anchor(bottom: bottomAnchor, right: rightAnchor,
                           left: leftAnchor, paddingRight: 16, paddingLeft: 16)
   }
}
