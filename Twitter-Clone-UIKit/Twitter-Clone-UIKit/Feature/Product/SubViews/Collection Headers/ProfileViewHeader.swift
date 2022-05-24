//
//  ProfileViewNavBar.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 21.05.2022.
//

import UIKit

class ProfileViewHeader: UICollectionReusableView {
   // MARK: properties

   weak var delegate: ProfileCollectionHeaderDelegate?

   let blueBackground: UIView = {
      let view = UIView()
      view.heightAnchor.constraint(equalToConstant: 115).isActive = true
      view.backgroundColor = .twitterBlue
      return view
   }()

   lazy var backButton: UIImageView = {
      let iv = UIImageView()
      iv.isUserInteractionEnabled = true
      iv.image = UIImage(named: "baseline_arrow_back_white_24dp")
      let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onBackButtonTapped))
      iv.addGestureRecognizer(tapGesture)
      return iv
   }()

   let profileImageView: UIImageView = {
      let iv = UIImageView()
      iv.setDimesions(width: 70, height: 70)
      iv.layer.borderColor = UIColor.white.cgColor
      iv.layer.borderWidth = 3
      iv.layer.cornerRadius = 35
      iv.backgroundColor = .twitterBlue
      iv.clipsToBounds = true
      iv.contentMode = .scaleAspectFill
      iv.layer.shadowColor = UIColor.clear.cgColor
      return iv
   }()

   lazy var editProfileButton: UIButton = {
      let button = CustomButton.rounded(
         title: "Loading",
         titleFont: UIFont.boldSystemFont(ofSize: 16),
         titleColor: UIColor.twitterBlue,
         backgroundColor: nil, cornerRadius: 17.5)

      button.setDimesions(width: 100, height: 35)
      button.layer.borderColor = UIColor.twitterBlue.cgColor
      button.layer.borderWidth = 1.5
      return button
   }()

   let userName: UILabel = {
      let name = UILabel()
      name.text = "Health Ledger"
      name.font = .boldSystemFont(ofSize: 20)
      name.textColor = .black

      return name
   }()

   let userTag: UILabel = {
      let tag = UILabel()
      tag.text = "@joker"
      tag.font = .preferredFont(forTextStyle: .body)
      tag.textColor = .lightGray
      return tag
   }()

   let bioText: UILabel = {
      let text = UILabel()
      text.text = "This is a user bio that will span more than one line for test purposes"
      text.numberOfLines = 0
      text.lineBreakMode = .byWordWrapping
      text.textColor = .darkGray

      return text
   }()

   lazy var following_followers_label = Following_Follower_Label(followerCount: 1,
                                                                 followedCount: 2)

   lazy var filterButtonRow = ProfileFilterRow()

   lazy var indicatorView: UIView = {
      let view = UIView()
      view.setDimesions(width: self.frame.width / 3, height: 2)
      view.backgroundColor = .twitterBlue
      return view
   }()

   // MARK: selectors

   @objc func onBackButtonTapped(_: UIImageView) {
      delegate?.handleBackButtonTap()
   }

   // MARK: init

   override init(frame: CGRect) {
      super.init(frame: frame)
      configureUI()
   }

   @available(*, unavailable)
   required init?(coder _: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   override var intrinsicContentSize: CGSize {
      return CGSize(width: UIScreen.main.bounds.width, height: 300)
   }

   // MARK: helpers

   func configureUI() {
      configureBackground()
      configureBackButton()
      configureProfileImageView()
      configureEditProfileButton()
      configureUserName()
      configureUserTag()
      configureBioText()
      configureFollowingFollowerLabel()
      configureFilterButtonRow()
      configureIndicatorView()
   }

   fileprivate func configureBackground() {
      addSubview(blueBackground)
      blueBackground
         .anchor(top: topAnchor,
                 right: rightAnchor, left: leftAnchor)
   }

   fileprivate func configureBackButton() {
      addSubview(backButton)
      backButton.anchor(top: safeAreaLayoutGuide.topAnchor,
                        left: safeAreaLayoutGuide.leftAnchor,
                        paddingTop: 0, paddingLeft: 10,
                        width: 24, height: 24)
   }

   fileprivate func configureProfileImageView() {
      addSubview(profileImageView)
      profileImageView.centerYAnchor
         .constraint(equalTo: blueBackground.bottomAnchor, constant: 10).isActive = true
      profileImageView.anchor(left: leftAnchor,
                              paddingLeft: 16)
   }

   fileprivate func configureEditProfileButton() {
      addSubview(editProfileButton)
      editProfileButton.anchor(bottom: profileImageView.bottomAnchor,
                               right: rightAnchor, paddingRight: 10)
   }

   fileprivate func configureUserName() {
      addSubview(userName)
      userName.anchor(top: profileImageView.bottomAnchor,
                      left: leftAnchor, paddingTop: 10, paddingLeft: 8)
   }

   fileprivate func configureUserTag() {
      addSubview(userTag)
      userTag.anchor(top: userName.bottomAnchor, left: leftAnchor,
                     paddingTop: 5, paddingLeft: 8)
   }

   fileprivate func configureBioText() {
      addSubview(bioText)
      bioText.anchor(top: userTag.bottomAnchor, right: rightAnchor,
                     left: leftAnchor, paddingTop: 5, paddingLeft: 8)
   }

   fileprivate func configureFollowingFollowerLabel() {
      addSubview(following_followers_label)
      following_followers_label.anchor(top: bioText.bottomAnchor,
                                       left: leftAnchor, paddingTop: 7, paddingLeft: 8)
   }

   fileprivate func configureFilterButtonRow() {
      addSubview(filterButtonRow)
      filterButtonRow.delegate = self
      filterButtonRow.anchor(top: following_followers_label.bottomAnchor,
                             right: rightAnchor, left: leftAnchor,
                             paddingTop: 10, height: 50)
   }

   fileprivate func configureIndicatorView() {
      addSubview(indicatorView)
      indicatorView.anchor(bottom: bottomAnchor,
                           left: leftAnchor)
   }
}


extension ProfileViewHeader : ProfileFilterRowDelegate {
   func didSelectAt(cell : ProfileFilterCell?) {
      guard let cell = cell else { return }
      let xPosition = cell.frame.origin.x
      UIView.animate(withDuration: 0.3) { [weak self] in
         self?.indicatorView.frame.origin.x = xPosition
      }
   }


}
