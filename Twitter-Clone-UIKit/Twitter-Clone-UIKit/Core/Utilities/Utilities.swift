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

   static func returnKeyWindow() -> UIWindow? {
      guard let windows = UIApplication.shared
         .connectedScenes.filter({ $0.activationState == .foregroundActive })
         .compactMap({ $0 as? UIWindowScene })
         .first?.windows,
         let keyWindow = windows.filter({ $0.isKeyWindow }).first
      else { return nil }
      return keyWindow
   }
}
