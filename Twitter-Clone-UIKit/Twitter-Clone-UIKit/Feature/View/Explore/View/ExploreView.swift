//
//  ExploreView.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 24.05.2022.
//

import UIKit

private let reuseID = "SearchUserID"

class ExploreView: UIView {
   // MARK:  properties


   lazy var collectionView : UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)

      return cv
   }()




   // MARK:  init
   override init(frame: CGRect) {
      super.init(frame: frame)
      configureUI()
      configureCollectionView()
   }

   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
      configureUI()
      configureCollectionView()
   }

   // MARK:  helpers
   func configureUI()  {
      backgroundColor = .white
      addSubview(collectionView)
      collectionView.anchor(top: topAnchor, bottom: bottomAnchor,
                            right: rightAnchor, left: leftAnchor)
}
   func configureCollectionView() {
      collectionView.register(SearchUserCellContainer.self, forCellWithReuseIdentifier: reuseID)
      collectionView.dataSource = self
      collectionView.delegate = self
   }

}


extension ExploreView : UICollectionViewDelegate, UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 25
   }

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID,
                                                     for: indexPath) as! SearchUserCellContainer
      return cell
   }

}

extension ExploreView : UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: frame.size.width, height: 100)
   }
}
