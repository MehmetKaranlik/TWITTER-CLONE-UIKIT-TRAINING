//
//  SearchUserCell.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 24.05.2022.
//

import UIKit

protocol SearchUserCellDelegate : AnyObject{
   func handleProfileImageTap(_ user : TweetUser)
}

class SearchUserCell: UIView {
   // MARK:  properties

   @IBOutlet  var contentView: SearchUserCell!

   @IBOutlet weak var imageView: UIImageView!

   @IBOutlet weak var userName: UILabel!

   @IBOutlet weak var userTag: UILabel!


   unowned var delegate : SearchUserCellDelegate?



   // MARK:  selectors

   @objc func handleProfileTap() {
   }




   // MARK:  init
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      createNib()

   }

   required init?(coder: NSCoder) {
      super.init(coder: coder)
      createNib()
   }

   override var intrinsicContentSize: CGSize {
      return CGSize(width: UIView.noIntrinsicMetric, height: 80)
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


class SearchUserCellContainer : UITableViewCell {
   // MARK:  properties

   let cell = SearchUserCell()



   // MARK:  init
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      configureCell()
   }

   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   override var intrinsicContentSize: CGSize {
      return CGSize(width: UIView.noIntrinsicMetric, height: 80)
   }

   // MARK:  helpers
   fileprivate func configureCell() {
      addSubview(cell)
      cell.anchor(top: topAnchor, bottom: bottomAnchor, right: rightAnchor, left: leftAnchor)
   }
}
