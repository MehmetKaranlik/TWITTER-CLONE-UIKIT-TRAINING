//
//  RegisterView.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 7.05.2022.
//

import Foundation
import UIKit

class RegisterView: UIView {
   var delegate: RegisterControllerDelegate?

   let emailTF: UITextField = {
      let tf = UITextField()
      tf.autocorrectionType = .no
      tf.autocapitalizationType = .none
      return tf
   }()

   let passwordTF: UITextField = {
      let tf = UITextField()
      tf.autocorrectionType = .no
      tf.autocapitalizationType = .none
      tf.isSecureTextEntry = true
      return tf
   }()

   let fullnameTF: UITextField = {
      let tf = UITextField()
      tf.autocorrectionType = .no
      tf.autocapitalizationType = .none
      return tf
   }()

   let usernameTF: UITextField = {
      let tf = UITextField()
      tf.autocorrectionType = .no
      tf.autocapitalizationType = .none
      tf.heightAnchor.constraint(equalToConstant: 30).isActive = true
      return tf
   }()

   lazy var emailTFContainer: UIView = {
      let container = Utilities()
         .inputContainerView(withImage: UIImage(named: "ic_mail_outline_white_2x-1")!,
                             textField: emailTF, textFieldPlaceHolder: "E-mail")
      return container
   }()

   lazy var passwordTFContainer: UIView = {
      let container = Utilities()
         .inputContainerView(withImage: UIImage(named: "ic_lock_outline_white_2x")!,
                             textField: passwordTF, textFieldPlaceHolder: "Password")
      return container
   }()

   lazy var fullnameTFContainer: UIView = {
      let container = Utilities()
         .inputContainerView(withImage: UIImage(named: "ic_person_outline_white_2x")!,
                             textField: fullnameTF, textFieldPlaceHolder: "Full name")
      return container
   }()

   lazy var usernameTFContainer: UIView = {
      let container = Utilities()
         .inputContainerView(withImage: UIImage(named: "ic_person_outline_white_2x")!,
                             textField: usernameTF, textFieldPlaceHolder: "Username")
      return container
   }()

   lazy var stack: UIStackView = {
      UIStackView(arrangedSubviews: [emailTFContainer, passwordTFContainer,
                                     fullnameTFContainer, usernameTFContainer])
   }()

   lazy var imagePickerViewButton: UIButton = {
      let button = CustomButton.iconButton(iconName: "plus_photo",tintColor: UIColor.white)
      button.addTarget(self, action: #selector(handlePicker), for: .touchUpInside)
      return button
   }()

   lazy var registerButton: UIButton = {
      let button = CustomButton
                  .rounded(title: "Register",
                  titleFont: UIFont.systemFont(ofSize: 16, weight: .bold),
                  titleColor: UIColor.twitterBlue,backgroundColor: UIColor.white,
                  cornerRadius: 10)

      return button
   }()

   lazy var navigateToLoginButton: UIButton = {
      let button = CustomButton
         .attributedButton("Already have an account ?",
                           firstPartColor: .white, firstPartFont: .boldSystemFont(ofSize: 16),
                           secondPartFont: .boldSystemFont(ofSize: 16),
                           "SIGN IN", secondPartColor: .white)
      button.addTarget(self, action: #selector(handleNavigation), for: .touchUpInside)
      return button
   }()

   let activityIndicator: UIActivityIndicatorView = {
      let view = UIActivityIndicatorView()
      view.hidesWhenStopped = true
      view.color = .white

      return view
   }()


   // MARK: selector

   @objc func handleNavigation() {
      delegate?.navigateButtonCallBack()
   }

   @objc func handlePicker() {
      delegate?.pickerButtonCallBack()
   }

   @objc func handleRegisterButton() {
      delegate?.registerButtonCallBack()
   }


   // MARK:  init
   override init(frame: CGRect) {
      super.init(frame: frame)
      createSubviews()
   }

   required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      createSubviews()
   }

   // MARK: helpers

   func createSubviews() {
      backgroundColor = .twitterBlue
      configureActivityIndicator()
      configureImagePickerView()
      configureTFStack()
      configureRegisterButton()
      configureNavigateButton()
   }

   fileprivate func configureActivityIndicator() {
      addSubview(activityIndicator)
      activityIndicator.centerX(inView: self)
      activityIndicator.centerY(inView: self)
   }

   fileprivate func configureImagePickerView() {
      addSubview(imagePickerViewButton)
      imagePickerViewButton.anchor(top: topAnchor, paddingTop: 70,
                                   width: 120, height: 120)
      imagePickerViewButton.centerX(inView: self)
   }

   fileprivate func configureRegisterButton() {
      addSubview(registerButton)
      registerButton.anchor(top: stack.bottomAnchor, right: rightAnchor,
                            left: leftAnchor, paddingTop: 30,
                            paddingRight: 40, paddingLeft: 40, height: 40)
   }

   fileprivate func configureNavigateButton() {
      addSubview(navigateToLoginButton)
      navigateToLoginButton.anchor(bottom: safeAreaLayoutGuide
         .bottomAnchor, paddingBottom: 5)
      navigateToLoginButton.centerX(inView: self)
   }

   fileprivate func configureTFStack() {
      stack.axis = .vertical
      stack.spacing = 40
      stack.distribution = .fillEqually
      addSubview(stack)
      stack.anchor(top: imagePickerViewButton.bottomAnchor, right: rightAnchor,
                   left: leftAnchor, paddingTop: 30, paddingRight: 40, paddingLeft: 40)
   }
}
