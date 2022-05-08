//
//  BaseView.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 8.05.2022.
//

import Foundation
import UIKit


class BaseView : UIView {

   // MARK:  properties

   var delegate : BaseControllerDelegate?


   lazy var actionButton: UIButton = {
      let button = CustomButton
         .rounded(title: nil, titleFont: nil, titleColor: .none,
         backgroundColor: UIColor.twitterBlue, cornerRadius: 25)
      button.setImage(UIImage(named: "new_tweet"), for: .normal)
      button.tintColor = .white
      button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
      return button
   }()





   // MARK:  selectors

   @objc func actionButtonTapped() {
      delegate?.actionButtonCallBack()
   }


   // MARK:  init

   override init(frame: CGRect) {
      super.init(frame: frame)
   }

   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }





 
}
