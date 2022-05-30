//
//  TweetDisplayView.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 29.05.2022.
//

import Foundation
import UIKit

private let headerID = "HeaderID"
private let cellID = "CellID"

class TweetDisplayView: UIView  {
   // MARK: properties

   lazy var collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      collectionView.delegate = self
      collectionView.dataSource = self

      return collectionView
   }()

   // MARK: init

   override init(frame: CGRect) {
      super.init(frame: frame)
      configureCollectionView()
      configureUI()

   }



   @available(*, unavailable)
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   // MARK: helpers

   func configureUI() {
      backgroundColor = .white
   }

   fileprivate func configureCollectionView() {
      addSubview(collectionView)
      collectionView.anchor(top: topAnchor, bottom: bottomAnchor,
                            right: rightAnchor, left: leftAnchor)
      collectionView.register(TweetDisplayHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
      collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
   }
}

   // MARK:  collectionView Delegate&Datasource
extension TweetDisplayView : UICollectionViewDelegate, UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView,
                       viewForSupplementaryElementOfKind kind: String,
                       at indexPath: IndexPath) -> UICollectionReusableView
   {
  let header = collectionView
     .dequeueReusableSupplementaryView(ofKind: kind,
                                       withReuseIdentifier: headerID,
                                       for: indexPath) as! TweetDisplayHeader


  return header
   }

   func collectionView(_ collectionView: UICollectionView,
                       cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
   {
  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID,
                                                for: indexPath) as! UICollectionViewCell
  cell.backgroundColor = .red
  return cell
   }

   func collectionView(_ collectionView: UICollectionView,
                       numberOfItemsInSection section: Int) -> Int
   {
  return 20
   }
}

   // MARK:  layoutDelegate
extension TweetDisplayView: UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize
   {
  return CGSize(width: frame.width, height: 100)
   }

   func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       referenceSizeForHeaderInSection section: Int) -> CGSize
   {
  return CGSize(width: frame.width, height: 200)
   }
}
