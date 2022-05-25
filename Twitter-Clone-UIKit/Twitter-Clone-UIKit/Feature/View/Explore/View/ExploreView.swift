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

   weak var viewModel : ExploreViewModel?

   lazy var tableView : UITableView = {
      let cv = UITableView(frame: .zero, style: .plain)
      return cv
   }()


   // MARK:  init
   override init(frame: CGRect) {
      super.init(frame: frame)
      configureUI()
      configureTableView()
   }

   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")

   }

   // MARK:  helpers
   func configureUI()  {
      backgroundColor = .white
      addSubview(tableView)
      tableView.anchor(top: topAnchor, bottom: bottomAnchor,
                            right: rightAnchor, left: leftAnchor)
}
   func configureTableView() {
      tableView.register(SearchUserCellContainer.self,
                         forCellReuseIdentifier: reuseID)
      tableView.dataSource = self
      tableView.delegate = self
   }

}


extension ExploreView : UITableViewDelegate, UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return viewModel?.searchedUsers?.count ?? 0
   }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: reuseID,
                                               for: indexPath) as! SearchUserCellContainer
      viewModel?.configureCell(cell: cell, user: (viewModel?.searchedUsers![indexPath.row])!)
      return cell
     }

   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      guard let user = viewModel?.searchedUsers?[indexPath.row] else { return}
      viewModel?.handleCellTap(user: user)
   }

}


