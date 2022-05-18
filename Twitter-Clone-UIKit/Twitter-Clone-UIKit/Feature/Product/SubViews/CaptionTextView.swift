   //
   //  CaptionTextView.swift
   //  Twitter-Clone-UIKit
   //
   //  Created by mehmet karanlık on 12.05.2022.
   //

import Foundation
import UIKit

class CaptionTextView : UITextView {
   // MARK:  properties
   let placeholderLabel : UILabel = {
      let label = UILabel()
      label.font = .systemFont(ofSize: 16, weight: .semibold)
      label.text = "What do you have on your mind?"
      label.textColor = .lightGray
      return label
   }()


   // MARK:  init



   override init(frame: CGRect, textContainer: NSTextContainer?) {
      super.init(frame: frame, textContainer: textContainer)
      configureView()
      configurePlaceholder()
   }

   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }


   // MARK:  helpers


   fileprivate func configureView() {
      textColor = .twitterBlue
      backgroundColor = .white
      font = .systemFont(ofSize: 16)
      isScrollEnabled = false
     // heightAnchor.constraint(equalToConstant: 300).isActive = true
   }

   fileprivate func configurePlaceholder() {
      addSubview(placeholderLabel)
      placeholderLabel.anchor(top: topAnchor, left: leftAnchor,
                              paddingTop: 8, paddingLeft: 4)
   }



}
