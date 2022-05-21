//
//  FeedController.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 4.05.2022.
//

import UIKit
private let reuseIdentifier = "TweetCell"

protocol TweetCellDelegate {
   func handleCommentButton()
   func handleRetweetButton()
   func handleLikeButton()
   func handleShareButton()
   func handleProfileImageTap()
}

class FeedController: UICollectionViewController {
   // MARK: properties

   let feedView = FeedView()
   let viewModel = FeedViewModel()

   // MARK: lifecycle

   override func viewDidLoad() {
      super.viewDidLoad()
      loadViewIfNeeded()
      configureUI()
   }

   // MARK: helpers



   private func configureUI() {
      //view = feedView
      collectionView.register(TweetCell.self,
                              forCellWithReuseIdentifier: reuseIdentifier)
      collectionView.dataSource = self
      collectionView.delegate = self
      configureNavBar()
   }

   fileprivate func configureNavBar() {
      let appereance = UINavigationBarAppearance()
      let navBar = navigationController?.navigationBar
      appereance.backgroundColor = .white
      navBar?.compactAppearance = appereance
      navBar?.scrollEdgeAppearance = appereance
      configureNavigationItemView()

   }

   fileprivate func configureNavigationItemView() {
      navigationItem.leftBarButtonItem = UIBarButtonItem(customView: feedView.navigationBarImageView)
      view.backgroundColor = .white
      let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
      imageView.contentMode = .scaleAspectFit
      imageView.setDimesions(width: 44, height: 44)
      navigationItem.titleView = imageView
   }
}

// MARK:  UICollectionViewDelegate & DataSource
extension FeedController {


   override func collectionView(_ collectionView: UICollectionView,
                                numberOfItemsInSection section: Int) -> Int {
      return viewModel.tweets.count
   }

   override func collectionView(_ collectionView: UICollectionView,
                                cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

      lazy var cell = collectionView
         .dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                              for: indexPath) as! TweetCell

      cell.delegate = self
      viewModel.configureCellUponReceiveData(cell: cell, index: indexPath.row)
      return cell
   }
}


extension FeedController : UICollectionViewDelegateFlowLayout {

   func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {

      return CGSize(width: view.frame.width, height: 150)


   }
}


extension FeedController : TweetCellDelegate {
   func handleProfileImageTap() {

      let vc = ProfileViewController()
      vc.navigationItem.leftBarButtonItem?.isEnabled = false
      navigationController?.pushViewController(vc, animated: true)
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
