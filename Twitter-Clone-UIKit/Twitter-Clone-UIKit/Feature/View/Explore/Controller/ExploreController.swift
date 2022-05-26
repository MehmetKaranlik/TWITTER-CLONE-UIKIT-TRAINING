//
//  ExploreController.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 4.05.2022.
//

import UIKit
import Combine


class ExploreController: UIViewController {
   // MARK: properties

   let exploreView = ExploreView()
   let viewModel = ExploreViewModel()

    var searchTextField: UITextField = {
      let tf = UITextField()
      let paddingView = UIView()
      paddingView.setDimesions(width: 15, height: 30)
      tf.setDimesions(width: 250, height: 30)
      tf.backgroundColor = .systemGroupedBackground
      tf.placeholder = "Search a user"
      tf.leftViewMode = .always
      tf.leftView = paddingView
      tf.layer.cornerRadius = 15
      tf.textColor = .twitterBlue
      tf.layer.borderWidth = 1
      tf.layer.borderColor = UIColor.lightGray.cgColor
      tf.autocorrectionType = .no
      tf.autocapitalizationType = .none
      return tf
   }()

   private let pageTitle: UILabel = {
      let label = UILabel()
      label.text = "Explore"
      label.font = .boldSystemFont(ofSize: 16)
      return label
   }()

   lazy var containerView: UIStackView = {
      let containerView = UIStackView(arrangedSubviews: [pageTitle,
                                                         searchTextField])
      containerView.axis = .horizontal
      containerView.spacing = 16
      containerView.distribution = .equalCentering

      return containerView
   }()

   // MARK:  selectors

   @objc func handleTextChange(_ textField: UITextField) {

   }
   var cancellables  = Set<AnyCancellable>()

   // MARK: lifecycle

   override func viewDidLoad() {
      super.viewDidLoad()
      configureUI()
      exploreView.viewModel = viewModel
      searchTextField.delegate = self
      searchTextField.registerPublisher(completion: { [weak self] value in
         self?.viewModel.searchInput = value

      }, cancellabel: &cancellables,debounceDuration: 0.5)




   }









   // MARK: helpers

   private func configureUI() {
      view = exploreView
      configureNavBar()
   }

   func configureNavBar() {
      navigationItem.titleView = containerView

      let appereance = UINavigationBarAppearance()
      let navBar = navigationController?.navigationBar
      appereance.backgroundColor = .white
      navBar?.compactAppearance = appereance
      navBar?.scrollEdgeAppearance = appereance
   }
}


extension ExploreController : UITextFieldDelegate {

}

