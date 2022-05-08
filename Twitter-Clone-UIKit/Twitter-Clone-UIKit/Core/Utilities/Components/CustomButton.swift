//
//  CustomButton.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 8.05.2022.
//

import Foundation
import UIKit


struct CustomButton {

  static func rounded(title: String? = nil,
                titleFont : UIFont? = .preferredFont(forTextStyle: .body, compatibleWith: .current),
                titleColor :UIColor? = UIColor.black,
                backgroundColor : UIColor? = UIColor.systemBlue,
                cornerRadius : CGFloat?) -> UIButton {
      let button = UIButton(type: .system)
     if let _ = title {
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
     }
      button.layer.cornerRadius = cornerRadius ?? 5
      button.backgroundColor = backgroundColor
      return button
   }

   static  func attributedButton(_ firstPart: String,firstPartColor : UIColor,
                                 firstPartFont: UIFont, secondPartFont: UIFont,
                                 _ secondPart: String,secondPartColor : UIColor
   ) -> UIButton {
      let button = UIButton(type: .system)

      let attributedTitle = NSMutableAttributedString(
         string: firstPart,
         attributes: [NSAttributedString.Key.foregroundColor : firstPartColor,
                      NSAttributedString.Key.font : firstPartFont
                     ])
      let attributedTitlePart2 = NSAttributedString(
         string: secondPart,
         attributes: [NSAttributedString.Key.foregroundColor  : secondPartColor,
                      NSAttributedString.Key.font : secondPartFont
                     ])
      attributedTitle.append(attributedTitlePart2)
      button.setAttributedTitle(attributedTitle, for: .normal)
      return button
   }

   static func iconButton(iconName: String, tintColor :UIColor? = nil) -> UIButton {
      let button = UIButton(type: .system)
      button.setImage(UIImage(named: iconName), for: .normal)
      if let _  = tintColor {
         button.tintColor = tintColor
      }
      return button
   }



}
