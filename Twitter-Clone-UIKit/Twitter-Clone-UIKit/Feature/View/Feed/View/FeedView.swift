//
//  FeedView.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 9.05.2022.
//

import Foundation
import UIKit
import SDWebImage

class FeedView : UIView {

   // MARK:  properties

   var user : BaseUserModel? {
      didSet {
         configureLeftBarButton()
      }
   }

   let navigationBarImageView : UIImageView = {
      let iv = UIImageView()
      iv.backgroundColor = .clear
      iv.setDimesions(width: 32, height: 32)
      iv.layer.cornerRadius = 32 / 2
      return iv
   }()




   // MARK:  selectors





   // MARK:  init

   override init(frame: CGRect) {

      super.init(frame: frame)
   }

   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }


   // MARK:  helpers
   func configureLeftBarButton() {
      guard let user = user else { return }
      guard let imagePath = user.profileImagePath else { return }
      guard let imageUrl = URL(string: imagePath) else { return }
      navigationBarImageView.layer.masksToBounds = true
      navigationBarImageView.sd_setImage(with: imageUrl)
   }
}


