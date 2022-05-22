//
//  ProfileView.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 21.05.2022.
//

import UIKit

class ProfileView: UIView {
   // MARK:  properties
   let headerView : ProfileViewHeader = {
      let view = ProfileViewHeader()
      return view
   }()



   // MARK:  init
   override init(frame: CGRect) {
      super.init(frame: frame)
   }

   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }



}


