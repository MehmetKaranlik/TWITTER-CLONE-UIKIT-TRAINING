   //
   //  LoginView.swift
   //  Twitter-Clone-UIKit
   //
   //  Created by mehmet karanlık on 8.05.2022.
   //

import Foundation
import UIKit

class LoginView : UIView {

      // MARK:  properties

   var delegate : LoginControllerDelegate?

   let appLogo: UIImageView = {
      let imageView = UIImageView(image: UIImage(named: "TwitterLogo"))
      imageView.contentMode = .scaleAspectFit
      imageView.clipsToBounds = true
      return imageView
   }()

   let emailTF: UITextField = {
      let tf = UITextField()
      tf.autocapitalizationType = .none
      tf.autocorrectionType = .no
      return tf
   }()

   let passwordTF: UITextField = {
      let tf = UITextField()
      tf.autocapitalizationType = .none
      tf.autocorrectionType = .no
      tf.isSecureTextEntry = true
      return tf
   }()

   lazy var emailContinerView: UIView = {
      let containerView = Utilities().inputContainerView(
         withImage: UIImage(named: "ic_mail_outline_white_2x-1")!,
         textField: emailTF, textFieldPlaceHolder: "E-mail")
      return containerView
   }()

   lazy var passwordContainerView: UIView = {
      let containerView = Utilities().inputContainerView(
         withImage: UIImage(named: "ic_lock_outline_white_2x")!,
         textField: passwordTF, textFieldPlaceHolder: "Password")
      return containerView

   }()

   lazy var loginButton: UIButton = {
      let button = CustomButton
         .rounded(title: "Login",titleFont: UIFont.systemFont(ofSize: 16, weight: .bold),
                  titleColor: UIColor.twitterBlue,backgroundColor: UIColor.white,
                  cornerRadius: 10)
      button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
      return button
   }()

   lazy var navigateToRegisterButton: UIButton = {
      let button =  CustomButton
         .attributedButton("Don't have an account ?",
                           firstPartColor: .white, firstPartFont: .boldSystemFont(ofSize: 16),
                           secondPartFont: .boldSystemFont(ofSize: 16),
                           "SIGN UP", secondPartColor: .white)
      button.addTarget(self, action: #selector(navigateButtonTapped), for: .touchUpInside)
      return button
   }()

   let activityIndicator : UIActivityIndicatorView =  {
      let ai = UIActivityIndicatorView()
      ai.color = .white
      return ai
   }()


      // MARK:  selectors

   @objc func navigateButtonTapped() {
      delegate?.navigateButtonCallBack()
   }

   @objc func loginButtonTapped() {
      delegate?.loginButtonCallBack()
   }


      // MARK:  load

   override init(frame: CGRect) {
      super.init(frame: frame)
      configureUI()

   }

   required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      configureUI()
   }

   func configureUI() {
      backgroundColor = .twitterBlue
      configureActivityIndicator()
      configureAppLogo()
      configureTextFields()
      configureLoginButton()
      configureNavigateToRegisterButton()
   }


   fileprivate func configureActivityIndicator() {
      addSubview(activityIndicator)
      activityIndicator.centerY(inView: self)
      activityIndicator.centerX(inView: self)
   }

   fileprivate func configureAppLogo() {
      addSubview(appLogo)
      appLogo.anchor(top: topAnchor, paddingTop: 30, width: 150, height: 150)
      appLogo.centerX(inView: self)
   }

   fileprivate func configureTextFields() {
      addSubview(emailContinerView)

      emailContinerView.anchor(top: appLogo.bottomAnchor, right: rightAnchor,
                               left: leftAnchor, paddingTop: 30,
                               paddingRight: 40, paddingLeft: 40, height: 30)
      addSubview(passwordContainerView)
      passwordContainerView.anchor(top: emailContinerView.bottomAnchor, right: rightAnchor,
                                   left: leftAnchor, paddingTop: 30,
                                   paddingRight: 40, paddingLeft: 40, height: 30)
   }

   fileprivate func configureLoginButton() {
      addSubview(loginButton)
      loginButton.anchor(top: passwordContainerView.bottomAnchor, right: rightAnchor,
                         left: leftAnchor, paddingTop: 30, paddingRight: 40,
                         paddingLeft: 40, height: 40)
   }

   fileprivate func configureNavigateToRegisterButton() {
      addSubview(navigateToRegisterButton)
      navigateToRegisterButton.anchor( bottom: bottomAnchor,paddingBottom: 40)
      navigateToRegisterButton.centerX(inView: self)
   }
}
