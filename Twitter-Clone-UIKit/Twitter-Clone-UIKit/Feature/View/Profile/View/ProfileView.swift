//
//  ProfileView.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 21.05.2022.
//

import UIKit
import FirebaseAuth

private let headerID = "reuseHeader"
private let cellID = "TweetCell"

class ProfileView: UIView {
   // MARK:  properties

   let viewModel : ProfileViewModel?

   lazy var collectionView : UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
      cv.delegate = self
      cv.dataSource = self
      return cv
   }()


   // MARK:  init
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   init(viewModel : ProfileViewModel) {
      self.viewModel = viewModel
      super.init(frame: .zero)
      configureCollectionView()
      configureUI()
   }


   // MARK:  helpers


   fileprivate func configureUI(){
      backgroundColor = .white
      addSubview(collectionView)
      collectionView.anchor(top: self.topAnchor, bottom: bottomAnchor,
                            right: rightAnchor, left: leftAnchor)
   }

   fileprivate func configureCollectionView() {
      collectionView.register(TweetCell.self, forCellWithReuseIdentifier: cellID)
      collectionView.register(
         ProfileViewHeader.self,
         forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
         withReuseIdentifier: headerID)
      collectionView.contentInsetAdjustmentBehavior = .never
   }


}


// MARK:  collectionView Delegate&Datasource
extension ProfileView : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                                viewForSupplementaryElementOfKind kind: String,
                                at indexPath: IndexPath) -> UICollectionReusableView
   {
  let header = collectionView
     .dequeueReusableSupplementaryView(ofKind: kind,
                                       withReuseIdentifier: headerID,
                                       for: indexPath) as! ProfileViewHeader
  header.delegate = self
  header.viewModel = viewModel
  viewModel!.configureUserUponData(headerView: header, user: viewModel!.user!)

  return header
   }

    func collectionView(_ collectionView: UICollectionView,
                                cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
   {
  let cell = collectionView
     .dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! TweetCell
  viewModel!.configureCellUponData(cell: cell,
                                  tweet: viewModel!.tweets![indexPath.row])
  return cell
   }

    func collectionView(_ collectionView: UICollectionView,
                                numberOfItemsInSection section: Int) -> Int
   {
  return viewModel?.tweets?.count ?? 0
   }
}

// MARK:  layoutDelegate
extension ProfileView: UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize
   {
  return CGSize(width: frame.width, height: 150)
   }

   func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       referenceSizeForHeaderInSection section: Int) -> CGSize
   {
  return CGSize(width: frame.width, height: 350)
   }
}

// MARK:  profileCollectionHeaderDelegate
extension ProfileView : ProfileCollectionHeaderDelegate {

   func handleFollowButtonTap() {
      guard let uid = Auth.auth().currentUser?.uid else { return }

      if (viewModel?.user?.uid != nil && viewModel?.user?.uid != uid) {
         
         viewModel?.followUser(targetUserUID: viewModel?.user?.uid ?? "")
      }
   }


   func handleBackButtonTap() {
      let keyWindow = Utilities.returnKeyWindow()
      guard let rootController = keyWindow?.rootViewController as? BaseController  else {return}
      if let feedStackController =  rootController.feed.navigationController?.topViewController {
         feedStackController.navigationController?.navigationBar.isHidden = false
         feedStackController.navigationController?.popViewController(animated: true)
      }
      if let exploreStackController = rootController.explore.navigationController?.topViewController {
         exploreStackController.navigationController?.navigationBar.isHidden = false
         exploreStackController.navigationController?.popViewController(animated: true)
      }
   }
}
