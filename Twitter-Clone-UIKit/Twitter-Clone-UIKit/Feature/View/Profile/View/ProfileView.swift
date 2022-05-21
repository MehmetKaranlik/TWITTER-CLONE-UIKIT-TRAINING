//
//  ProfileView.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 21.05.2022.
//

import UIKit

class ProfileView: UIView {
   // MARK:  properties

   let backButtonView : UIImageView = {
      let iv = UIImageView()
      iv.image = UIImage(named: "baseline_arrow_back_white_24dp")
      return iv
   }()



   // MARK:  init
   override init(frame: CGRect) {
      super.init(frame: frame)
      configureUI()
   }

   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }


   // MARK:  helpers

   fileprivate func configureUI() {
      backgroundColor = .white
   }

}
