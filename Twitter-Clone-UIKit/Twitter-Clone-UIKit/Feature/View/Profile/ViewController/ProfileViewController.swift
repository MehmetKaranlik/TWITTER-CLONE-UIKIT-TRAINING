//
//  ProfileViewController.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 21.05.2022.
//

import UIKit

private let headerID = "reuseHeader"
private let cellID = "TweetCell"

class ProfileViewController: UICollectionViewController {
   // MARK: properties

   let profileView = ProfileView()

   // MARK: selectors

   @objc func handleBackButton() {
      navigationController?.popViewController(animated: true)
   }

   // MARK: init

   override func viewDidLoad() {
      super.viewDidLoad()
      configureCollectionView()
      configureNavBar()
   }

   // MARK: helpers

   fileprivate func configureCollectionView() {
      // view = profileView
      collectionView.register(TweetCell.self, forCellWithReuseIdentifier: cellID)
      collectionView
         .register(ProfileViewHeader.self,
                   forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                   withReuseIdentifier: headerID)
      collectionView.contentInsetAdjustmentBehavior = .never
   }

   fileprivate func configureNavBar() {
      let appereance = UINavigationBarAppearance()
      //  appereance.backgroundColor = .twitterBlue
      let navBar = navigationController?.navigationBar
      navBar?.compactAppearance = appereance
      navBar?.isHidden = true
      navBar?.scrollEdgeAppearance = appereance
   }
}

// MARK:  setup collectionView
extension ProfileViewController {
   override func collectionView(_ collectionView: UICollectionView,
                                viewForSupplementaryElementOfKind kind: String,
                                at indexPath: IndexPath) -> UICollectionReusableView
   {
      let header = collectionView
         .dequeueReusableSupplementaryView(ofKind: kind,
                                           withReuseIdentifier: headerID, for: indexPath) as! ProfileViewHeader
      return header
   }

   override func collectionView(_ collectionView: UICollectionView,
                                cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
   {
      let cell = collectionView
         .dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
      return cell
   }

   override func collectionView(_ collectionView: UICollectionView,
                                numberOfItemsInSection section: Int) -> Int
   {
      return 5
   }
}


// MARK:  setup collectionViewLayout

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: view.frame.width, height: 150)
   }

   func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       referenceSizeForHeaderInSection section: Int) -> CGSize
   {
      return CGSize(width: view.frame.width, height: 300)
   }
}
