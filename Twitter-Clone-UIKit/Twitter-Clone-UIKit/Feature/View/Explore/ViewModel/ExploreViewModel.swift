   //
   //  ExploreViewModel.swift
   //  Twitter-Clone-UIKit
   //
   //  Created by mehmet karanlık on 25.05.2022.
   //

import Foundation
import SwiftUI


class ExploreViewModel : ObservableObject {
   private  var service : ExploreService = ExploreService()

   var searchInput : String? {
      didSet {

         getSearchedUsersByInput(input: searchInput ?? "")
      }
   }

   var searchedUsers : [TweetUser]? {
      didSet {
         print("this is worked")
         configureTableViewUponData()
      }
   }





   func handleCellTap(user: TweetUser) {
      let vc = ProfileViewController()
      vc.viewModel.user = user
      let window = Utilities.returnKeyWindow()
      let root = window?.rootViewController as! BaseController
      root.explore.navigationController?.pushViewController(vc, animated: true)
   }



   func configureCell(cell : SearchUserCellContainer , user : TweetUser) {
      guard let imageUrl = URL(string: user.profileImagePath ?? "") else { return }
      cell.cell.imageView.sd_setImage(with: imageUrl)
      cell.cell.userName.text = user.fullname
      cell.cell.userTag.text = "@\(user.username ?? "")"
   }

   private   func getSearchedUsersByInput(input: String) {
      service.fetchUserByInput(input: input) { [weak self]users in
         print(users)
         self?.searchedUsers = users
      }
   }


   private func configureTableViewUponData() {
      let window = Utilities.returnKeyWindow()
      guard let root = window?.rootViewController as? BaseController else { return }
      root.explore.exploreView.tableView.reloadData()

   }



}
