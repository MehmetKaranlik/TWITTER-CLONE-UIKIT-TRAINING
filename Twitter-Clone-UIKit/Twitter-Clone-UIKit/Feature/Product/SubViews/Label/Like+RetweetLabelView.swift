//
//  Like+RetweetLabelView.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 29.05.2022.
//

import UIKit

class Like_Retweet_LabelView: UIView {

   // MARK:  properties
   let likeCount : Int
   let retweetCount : Int


   private lazy var likeCountText : UILabel = {
      let label = UILabel()
      label.text = "\(likeCount) Likes"
      label.textColor = .darkGray
      label.font = .systemFont(ofSize: 14)
      return label
   }()

   private lazy var retweetCountText : UILabel = {
      let label = UILabel()
      label.text = "\(retweetCount) Retweets"
      label.textColor = .darkGray
      label.font = .systemFont(ofSize: 14)
      return label
   }()

   private lazy var containerStack : UIStackView = {
      let stackView = UIStackView(arrangedSubviews: [likeCountText,retweetCountText])
      stackView.axis = .horizontal
      stackView.spacing = 4
      stackView.distribution = .fillProportionally
      return stackView
   }()


   // MARK:  init
   init(likeCount: Int, retweetCount : Int) {
      self.likeCount = likeCount
      self.retweetCount = retweetCount
      super.init(frame: .zero)
      configureUI()

   }

   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   // MARK:  helpers
   func configureUI() {
      addSubview(containerStack)
      containerStack.anchor(top: topAnchor, bottom: bottomAnchor
                            , right: rightAnchor, left: leftAnchor)

   }


}
