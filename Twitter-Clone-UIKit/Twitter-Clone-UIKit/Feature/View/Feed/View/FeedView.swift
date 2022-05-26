//
//  FeedView.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 9.05.2022.
//

import Foundation
import UIKit
import SDWebImage

private let reuseIdentifier = "TweetCell"

class FeedView : UIView {

   weak var viewModel : FeedViewModel?

   // MARK:  properties

   var user : BaseUserModel? {
      didSet {
         configureLeftBarButton()
      }
   }


   lazy var collectionView : UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
      return cv
   }()


   let navigationBarImageView : UIImageView = {
      let iv = UIImageView()
      iv.backgroundColor = .clear
      iv.setDimesions(width: 32, height: 32)
      iv.layer.cornerRadius = 32 / 2
      return iv
   }()


   // MARK:  selectors

   // MARK:  init

   override init(frame: CGRect) {
      super.init(frame: frame)
      addSubview(collectionView)
      collectionView.anchor(top: topAnchor, bottom: bottomAnchor,
                            right: rightAnchor, left: leftAnchor)
      configureCollectionView()

   }

   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }


   // MARK:  helpers
   func configureCollectionView() {
      collectionView.register(TweetCell.self,
                              forCellWithReuseIdentifier: reuseIdentifier)
      collectionView.delegate = self
      collectionView.dataSource = self
   }

   func configureLeftBarButton() {
      guard let user = user else { return }
      guard let imagePath = user.profileImagePath else { return }
      guard let imageUrl = URL(string: imagePath) else { return }
      navigationBarImageView.layer.masksToBounds = true
      navigationBarImageView.sd_setImage(with: imageUrl)
   }
}





extension FeedView : UICollectionViewDelegate, UICollectionViewDataSource {


   func collectionView(_ collectionView: UICollectionView,
                                numberOfItemsInSection section: Int) -> Int {
      return viewModel?.tweets.count  ?? 0
   }

    func collectionView(_ collectionView: UICollectionView,
                                cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

      lazy var cell = collectionView
         .dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                              for: indexPath) as! TweetCell
      cell.delegate = self
       viewModel?.configureCellUponReceiveData(cell: cell,
                                               index: indexPath.row)
      return cell
   }
}


extension FeedView : UICollectionViewDelegateFlowLayout {

   func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {

      return CGSize(width: frame.width, height: 150)


   }
}


extension FeedView : TweetCellDelegate {
   func handleProfileImageTap(user : TweetUser) {
      let vc = ProfileViewController()
      vc.viewModel.user = user
      let window = Utilities.returnKeyWindow()
      let root = window?.rootViewController as! BaseController
      root.feed.navigationController?.pushViewController(vc, animated: true)
   }



   func handleCommentButton() {
      print("comment")
   }

   func handleRetweetButton() {
      print("retweet")
   }

   func handleLikeButton() {
      print("like")

   }

   func handleShareButton() {
      print("share")
   }
}

