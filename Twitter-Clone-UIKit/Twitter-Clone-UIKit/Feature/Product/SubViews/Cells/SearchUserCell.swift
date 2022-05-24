//
//  SearchUserCell.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 24.05.2022.
//

import UIKit

class SearchUserCell: UIView {

   @IBOutlet  var contentView: SearchUserCell!


   override init(frame: CGRect) {
      super.init(frame: frame)
      createNib()
   }

   required init?(coder: NSCoder) {
      super.init(coder: coder)
      createNib()
   }

   override var intrinsicContentSize: CGSize {
      return CGSize(width: UIView.noIntrinsicMetric, height: 100)
   }

   // MARK:  helpers
   func createNib() {
      let bundle = Bundle(for: SearchUserCell.self)
      bundle.loadNibNamed("SearchUserCell", owner: self, options: nil)
      addSubview(contentView)
      contentView.backgroundColor = .white
      contentView.translatesAutoresizingMaskIntoConstraints = false

      contentView.anchor(top: topAnchor, bottom: bottomAnchor,
                         right: rightAnchor, left: leftAnchor)
   }
}


class SearchUserCellContainer : UICollectionViewCell {
   let cell = SearchUserCell()

   override init(frame: CGRect) {
      super.init(frame: frame)
      addSubview(cell)
      cell.anchor(top: topAnchor, bottom: bottomAnchor, right: rightAnchor, left: leftAnchor)
   }

   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   override var intrinsicContentSize: CGSize {
      return CGSize(width: UIView.noIntrinsicMetric, height: 100)
   }
}
