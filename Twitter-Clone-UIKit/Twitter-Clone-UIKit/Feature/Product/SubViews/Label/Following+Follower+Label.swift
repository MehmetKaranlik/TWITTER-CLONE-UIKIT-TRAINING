//
//  Following+Follower+Label.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 22.05.2022.
//

import UIKit

class Following_Follower_Label: UIView {
   // MARK: properties

   var followerCount: Int
   var followedCount: Int

   lazy var followerText: UILabel = {
      let label = UILabel()
      let attributedText = populateAttributedString(followerCount.description, "followers")
      label.attributedText = attributedText
      return label
   }()

   lazy var folllowingText: UILabel = {
      let label = UILabel()
      let attributedText = populateAttributedString(followedCount.description, "following")
      label.attributedText = attributedText
      return label
   }()

   // MARK: init

   required init(followerCount: Int, followedCount: Int) {
      self.followedCount = followedCount
      self.followerCount = followerCount
      super.init(frame: .zero)
      configureUI()
   }

   @available(*, unavailable)
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   // MARK: helpers

   private func configureUI() {
      let stack = UIStackView(arrangedSubviews: [folllowingText,
                                                 followerText])
      stack.axis = .horizontal
      stack.spacing = 5
      stack.alignment = .leading
      stack.distribution = .fill
      addSubview(stack)
      stack.anchor(top: topAnchor, bottom: bottomAnchor,
                   right: rightAnchor, left: leftAnchor)
   }




   private func populateAttributedString(_ string1 : String,
                                         _ string2 : String) -> NSAttributedString {
      let attributedText = NSMutableAttributedString(
         string: string1 + " ",
         attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),

         ])
      let attributedText2 = NSAttributedString(
         string: string2,
         attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.lightGray,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),

         ])
      attributedText.append(attributedText2)
      return attributedText
   }
}
