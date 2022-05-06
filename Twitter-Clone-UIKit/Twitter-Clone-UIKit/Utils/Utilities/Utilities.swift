//
//  Utilities.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 5.05.2022.
//

import UIKit

class Utilities {

   let profileImagePlaceHolderUrl = "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"

   func inputContainerView(withImage: UIImage, textField: UITextField, textFieldPlaceHolder: String) -> UIView {
      let view = UIView()
      let iv = UIImageView(image: withImage)
      let tf = textField
      let seperatorView = UIView()
      view.addSubview(seperatorView)
      seperatorView.anchor(top: view.bottomAnchor, right: view.rightAnchor,
                           left: view.leftAnchor, paddingTop: 5, height: 0.5)
      seperatorView.backgroundColor = .white
      view.addSubview(iv)
      iv.anchor(top: view.topAnchor, bottom: view.bottomAnchor,
                left: view.leftAnchor, paddingLeft: 0, width: 30)
      view.addSubview(tf)
      tf.anchor(top: view.topAnchor, bottom: view.bottomAnchor,
                right: view.rightAnchor, left: iv.rightAnchor,
                paddingRight: 6, paddingLeft: 6)
      let attributedPlaceHolder = NSAttributedString(
         string: textFieldPlaceHolder,
         attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
      )
      tf.attributedPlaceholder = attributedPlaceHolder
      tf.font = .preferredFont(forTextStyle: .body, compatibleWith: .current)
      tf.textColor = .white
      return view
   }

   func attributedButton(_ firstPart: String,_ secondPart: String) -> UIButton {
      let button = UIButton(type: .system)

      let attributedTitle = NSMutableAttributedString(
         string: firstPart,
         attributes: [NSAttributedString.Key.foregroundColor : UIColor.white,
                      NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .regular)
                     ])
      let attributedTitlePart2 = NSAttributedString(
         string: secondPart,
         attributes: [NSAttributedString.Key.foregroundColor  : UIColor.white,
                      NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .bold)
                     ])
      attributedTitle.append(attributedTitlePart2)
      button.setAttributedTitle(attributedTitle, for: .normal)
      return button
   }
}
