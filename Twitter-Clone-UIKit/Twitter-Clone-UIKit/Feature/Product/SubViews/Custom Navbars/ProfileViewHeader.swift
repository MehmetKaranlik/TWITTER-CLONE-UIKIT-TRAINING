//
//  ProfileViewNavBar.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 21.05.2022.
//

import UIKit

class ProfileViewHeader: UICollectionReusableView {
   // MARK:  properties

   let blueBackground : UIView = {
      let view = UIView()
      view.heightAnchor.constraint(equalToConstant: 150).isActive = true
      view.backgroundColor = .twitterBlue
      return view
   }()



   let profileImageView : UIImageView = {
      let iv = UIImageView()
      iv.setDimesions(width: 70, height: 70)
      iv.layer.borderColor = UIColor.white.cgColor
      iv.layer.borderWidth = 3
      iv.layer.cornerRadius = 35
      iv.backgroundColor = .twitterBlue
      iv.layer.shadowColor = UIColor.clear.cgColor
      return iv
   }()


   lazy var editProfileButton : UIButton = {
      let button = UIButton(type: .custom)
      button.setTitle("Edit Profile", for: .normal)
      button.setTitleColor(UIColor.twitterBlue, for: .normal)
      button.titleLabel?.font = .boldSystemFont(ofSize: 16)
      button.setDimesions(width: 100, height: 35)
      button.layer.borderWidth = 1.5
      button.layer.cornerRadius = 35/2
      button.layer.borderColor = UIColor.systemBlue.cgColor
      return button
   }()


   let userName : UILabel = {
      let name = UILabel()
      name.text = "Health Ledger"
      name.font = .boldSystemFont(ofSize: 20)
      name.textColor = .black

      return name
   }()




   // MARK:  init
   override init(frame: CGRect) {
      super.init(frame: frame)
      configureUI()
   }


   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   override var intrinsicContentSize: CGSize {
      return CGSize(width: UIScreen.main.bounds.width, height: 300)
   }


   // MARK:  helpers







   func configureUI() {
      configureBackground()
      configureProfileImageView()
      configureEditProfileButton()
      addSubview(userName)
      userName.anchor(top: profileImageView.bottomAnchor,
                      left: self.leftAnchor, paddingTop: 10, paddingLeft: 8)
   }

   fileprivate func configureBackground() {
      addSubview(blueBackground)
      blueBackground
         .anchor(top: self.topAnchor, right: self.rightAnchor, left: self.leftAnchor)
   }

   fileprivate func configureProfileImageView() {
      addSubview(profileImageView)
      profileImageView.centerYAnchor
         .constraint(equalTo: blueBackground.bottomAnchor,constant: 10).isActive = true
      profileImageView.anchor(left: self.leftAnchor, paddingLeft: 16)
   }

   fileprivate func configureEditProfileButton() {
      addSubview(editProfileButton)
      editProfileButton.anchor( bottom: profileImageView.bottomAnchor,
                                right: self.rightAnchor,paddingRight: 10)
   }
}
