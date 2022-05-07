//
//  LoginController.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 5.05.2022.
//

import UIKit

class LoginController: UIViewController {
   // MARK: properties


    let viewModel = LoginViewModel()

   private let appLogo: UIImageView = {
      let imageView = UIImageView(image: UIImage(named: "TwitterLogo"))
      imageView.contentMode = .scaleAspectFit
      imageView.clipsToBounds = true
      return imageView
   }()

   private let emailTF: UITextField = {
      let tf = UITextField()
      tf.autocapitalizationType = .none
      tf.autocorrectionType = .no
      return tf
   }()

   private let passwordTF: UITextField = {
      let tf = UITextField()
      tf.autocapitalizationType = .none
      tf.autocorrectionType = .no
      tf.isSecureTextEntry = true
      return tf
   }()

   private lazy var emailContinerView: UIView = {
      let containerView = Utilities().inputContainerView(
         withImage: UIImage(named: "ic_mail_outline_white_2x-1")!,
         textField: emailTF, textFieldPlaceHolder: "E-mail")
      return containerView
   }()

   private lazy var passwordContainerView: UIView = {
      let containerView = Utilities().inputContainerView(
         withImage: UIImage(named: "ic_lock_outline_white_2x")!,
         textField: passwordTF, textFieldPlaceHolder: "Password")
      return containerView

   }()

   private let loginButton: UIButton = {
      let button = UIButton(type: .system)
      button.setTitle("Log-in", for: .normal)
      button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
      button.setTitleColor(UIColor.twitterBlue, for: .normal)
      button.layer.cornerRadius = 5
      button.backgroundColor = .white
      button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
      return button
   }()

   private let navigateToRegisterButton: UIButton = {
      let button =  Utilities().attributedButton("Don't have an account ? ", "Sign UP")
      button.addTarget(self, action: #selector(navigateButtonTapped), for: .touchUpInside)
      return button
   }()

   private let activityIndicator : UIActivityIndicatorView =  {
      let ai = UIActivityIndicatorView()
      ai.color = .white
      return ai
   }()

   // MARK: lifecycle

   // MARK: selectors

   @objc func loginButtonTapped() {
      activityIndicator.startAnimating()
      viewModel.loginUser(email: emailTF.text, password: passwordTF.text,
                          navigationController: self.navigationController!) { [weak self] in
         // on fail
         self?.activityIndicator.stopAnimating()
         self?.passwordTF.text  = nil

      }
   }
   @objc func navigateButtonTapped() {
      navigationController?.pushViewController(RegisterController(), animated: true)
   }
   override func viewDidLoad() {
      super.viewDidLoad()
      configureUI()
   }

   // MARK: helper



   private func configureUI() {
      view.backgroundColor = .twitterBlue
      navigationController?.navigationBar.barStyle = .black
      configureActivityIndicator()
      configureAppLogo()
      configureTextFields()
      configureLoginButton()
      configureNavigateToRegisterButton()
   }


   fileprivate func configureActivityIndicator() {
      view.addSubview(activityIndicator)
      activityIndicator.centerY(inView: view)
      activityIndicator.centerX(inView: view)
   }

   fileprivate func configureAppLogo() {
      view.addSubview(appLogo)
      appLogo.anchor(top: view.topAnchor, paddingTop: 30, width: 150, height: 150)
      appLogo.centerX(inView: view)
   }

   fileprivate func configureTextFields() {
      view.addSubview(emailContinerView)

      emailContinerView.anchor(top: appLogo.bottomAnchor, right: view.rightAnchor,
                               left: view.leftAnchor, paddingTop: 30,
                               paddingRight: 40, paddingLeft: 40, height: 30)
      view.addSubview(passwordContainerView)
      passwordContainerView.anchor(top: emailContinerView.bottomAnchor, right: view.rightAnchor,
                                   left: view.leftAnchor, paddingTop: 30,
                                   paddingRight: 40, paddingLeft: 40, height: 30)
   }

   fileprivate func configureLoginButton() {
      view.addSubview(loginButton)
      loginButton.anchor(top: passwordContainerView.bottomAnchor, right: view.rightAnchor,
                         left: view.leftAnchor, paddingTop: 30, paddingRight: 40,
                         paddingLeft: 40, height: 40)
   }

   fileprivate func configureNavigateToRegisterButton() {
      view.addSubview(navigateToRegisterButton)
      navigateToRegisterButton.anchor( bottom: view.bottomAnchor,paddingBottom: 40)
      navigateToRegisterButton.centerX(inView: view)
   }
}
