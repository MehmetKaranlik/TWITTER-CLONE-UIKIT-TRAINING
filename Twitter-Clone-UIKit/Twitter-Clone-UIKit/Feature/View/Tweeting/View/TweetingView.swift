//
//  TweetingView.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 10.05.2022.
//

import Foundation
import UIKit

class TweetingView: UIView {
   // MARK: properties

   let captionTextView : CaptionTextView = CaptionTextView()

   var currentUser: BaseUserModel? {
      didSet {
         guard let imageString = currentUser?.profileImagePath else { return }
         guard let url = URL(string: imageString) else { return }
         profileImageView.sd_setImage(with: url)

      }
   }

   var delegate: TweetingControllerDelegate?
   // nav items
   lazy var leftNavigationButton = UIBarButtonItem(
      barButtonSystemItem: .cancel, target: self, action: #selector(handleLeftNavButton))

   lazy var tweetButton: UIButton = {
      let button = CustomButton.rounded(
         title: "Tweet", titleFont: UIFont.systemFont(ofSize: 5, weight: .bold),
         titleColor: UIColor.white, backgroundColor: UIColor.twitterBlue, cornerRadius: 15)
      button.setDimesions(width: 80, height: 30)
      button.addTarget(self, action: #selector(handleTweetButton), for: .touchUpInside)
      return button
   }()

   lazy var rightNavigationButton: UIBarButtonItem = {
      let item = UIBarButtonItem()
      item.customView = tweetButton
      return item
   }()

   private let profileImageView : UIImageView = {
      let iv = UIImageView()
      iv.contentMode = .scaleAspectFill
      iv.clipsToBounds = true
      iv.setDimesions(width: 48, height: 48)
      iv.layer.cornerRadius = 48 / 2
      return iv
   }()

   private lazy var stack : UIStackView = {
      let stack = UIStackView(arrangedSubviews: [profileImageView,
                                                 captionTextView])
      stack.axis = .horizontal
      stack.spacing = 12
      return stack
   }()

   lazy var loadingView : UIProgressView = {
      let view = UIProgressView()
      view.isHidden = true
      return view
   }()

   




   // MARK: selectors

   @objc func handleTextChange() {
      if captionTextView.text.count > 0  {
         captionTextView.placeholderLabel.isHidden = true
      }else {
         captionTextView.placeholderLabel.isHidden = false
      }
   }

   @objc func handleLeftNavButton() {
      delegate?.handleCancelButtonCallback()
   }

   @objc func handleTweetButton() {
      delegate?.handleTweetButtonCallback()
   }

   // MARK: init
   override init(frame: CGRect) {
      super.init(frame: frame)
      fetchCurrentUser()
      configureNotificationCenter()
      configureUI()
   }

   required init?(coder: NSCoder) {
      super.init(coder: coder)

   }

   // MARK: helpers


   func configureUI() {
      configureStack()
      configureLoadingView()
   }

   fileprivate func configureStack() {
      addSubview(stack)
      stack.anchor(top: safeAreaLayoutGuide.topAnchor,
                   right: rightAnchor,left: leftAnchor,
                   paddingTop: 10, paddingRight: 10, paddingLeft: 10)
   }

   fileprivate func configureLoadingView() {
      addSubview(loadingView)
      loadingView.centerX(inView: self)
      loadingView.centerY(inView: self)
   }

   fileprivate func configureNotificationCenter() {
      NotificationCenter
         .default
         .addObserver(self,
                      selector: #selector(handleTextChange),
                      name: CaptionTextView.textDidChangeNotification, object: nil)
   }

   func fetchCurrentUser() {
      guard let keyWindow = Utilities.returnKeyWindow() else { return }
      guard let root = keyWindow.rootViewController as? BaseController else { return }
      assignUser(viewModel:  root.viewModel)

   }


   private func assignUser(viewModel : BaseViewModel?) {
      if viewModel?.currentUser != nil {
         self.currentUser = viewModel?.currentUser
      }else {
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.assignUser(viewModel:  viewModel)
         }
      }
   }
}
