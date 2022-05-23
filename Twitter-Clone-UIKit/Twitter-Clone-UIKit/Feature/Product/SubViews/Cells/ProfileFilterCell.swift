//
//  ProfileFilterCell.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 23.05.2022.
//

import Foundation
import UIKit

class ProfileFilterCell: UICollectionViewCell {
   // MARK: properties

   let title: UILabel = {
      let title = UILabel()
      title.text = "Test"
      title.textColor = .lightGray
      title.font = .systemFont(ofSize: 14)
      return title
   }()

   // MARK: init

   override init(frame: CGRect) {
      super.init(frame: frame)
      addSubview(title)
      title.centerX(inView: self)
      title.centerY(inView: self)
   }

   override var isSelected: Bool {
      didSet {
         title.textColor = isSelected ? .twitterBlue : .lightGray
         title.font = isSelected ?
            .boldSystemFont(ofSize: 16)
            : .systemFont(ofSize: 14)
      }
   }

   @available(*, unavailable)
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   // MARK: helpers
}
