//
//  ProfileFilterRow.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 23.05.2022.
//

import Foundation
import UIKit

private let filterCellID = "filterCell"

protocol ProfileFilterRowDelegate : AnyObject{
   func didSelectAt(cell : ProfileFilterCell?)
}


class ProfileFilterRow: UIView {
   // MARK:  properties

   weak var delegate : ProfileFilterRowDelegate?

   lazy var collectionView : UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
      cv.backgroundColor = .white

      cv.delegate = self
      cv.dataSource = self
      return cv
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


   private func configureUI() {
      configureCollectionView()

   }

   fileprivate func configureCollectionView() {
      collectionView.register(ProfileFilterCell.self, forCellWithReuseIdentifier: filterCellID)
      addSubview(collectionView)
      collectionView.anchor(top: topAnchor, bottom: bottomAnchor,
                            right: rightAnchor, left: leftAnchor)

   }
}



// MARK:  collectionView Datasource & Delegate
extension ProfileFilterRow : UICollectionViewDelegate, UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView,
                       numberOfItemsInSection section: Int) -> Int {
      return 3
   }

   func collectionView(_ collectionView: UICollectionView,
                       cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView
         .dequeueReusableCell(withReuseIdentifier: filterCellID,
                              for: indexPath) as! ProfileFilterCell
      cell.title.text = defineCellText(indexPath.row)

      return cell
   }

   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      let cell = collectionView.cellForItem(at: indexPath) as! ProfileFilterCell?
      delegate?
         .didSelectAt(cell:cell)
   }


   func defineCellText(_ index : Int) -> String {
      switch index {
         case 0:
            return "Tweets"
         case 1:
            return "Tweets&Replies"
         case 2:
            return "Likes"
         default:
            return "Tweets"

      }
   }
 

}


// MARK:  collectionView Layout Delegate
extension ProfileFilterRow : UICollectionViewDelegateFlowLayout {

   func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: self.frame.width / 3, height: 49)
   }

   func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
      return 0
   }
   
}
