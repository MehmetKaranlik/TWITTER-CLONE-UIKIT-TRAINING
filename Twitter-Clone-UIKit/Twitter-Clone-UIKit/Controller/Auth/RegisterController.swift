//
//  RegisterController.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 5.05.2022.
//

import UIKit

class RegisterController: UIViewController {
   // MARK: properties

   let viewModel = RegisterViewModel()

   private let imagePickerController = UIImagePickerController()

   private let imagePickerViewButton: UIButton = {
      let button = UIButton(type: .system)
      button.setImage(UIImage(named: "plus_photo"), for: .normal)
      button.tintColor = .white
      button.addTarget(self, action: #selector(handlePickerTapped), for: .touchUpInside)
      return button
   }()

   private let emailTF: UITextField = {
      let tf = UITextField()
      tf.autocorrectionType = .no
      tf.autocapitalizationType = .none
      return tf
   }()

   private let passwordTF: UITextField = {
      let tf = UITextField()
      tf.autocorrectionType = .no
      tf.autocapitalizationType = .none
      tf.isSecureTextEntry = true
      return tf
   }()

   private let fullnameTF: UITextField = {
      let tf = UITextField()
      tf.autocorrectionType = .no
      tf.autocapitalizationType = .none
      return tf
   }()

   private let usernameTF: UITextField = {
      let tf = UITextField()
      tf.autocorrectionType = .no
      tf.autocapitalizationType = .none
      tf.heightAnchor.constraint(equalToConstant: 30).isActive = true
      return tf
   }()

   private let registerButton: UIButton = {
      let button = UIButton(type: .system)
      button.setTitle("Register", for: .normal)
      button.tintColor = .twitterBlue
      button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
      button.backgroundColor = .white
      button.layer.cornerRadius = 5
      button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)

      return button
   }()

   private lazy var emailTFContainer: UIView = {
      let container = Utilities().inputContainerView(withImage: UIImage(named: "ic_mail_outline_white_2x-1")!, textField: emailTF, textFieldPlaceHolder: "E-mail")
      return container
   }()

   private lazy var passwordTFContainer: UIView = {
      let container = Utilities().inputContainerView(withImage: UIImage(named: "ic_lock_outline_white_2x")!, textField: passwordTF, textFieldPlaceHolder: "Password")
      return container
   }()

   private lazy var fullnameTFContainer: UIView = {
      let container = Utilities().inputContainerView(withImage: UIImage(named: "ic_person_outline_white_2x")!, textField: fullnameTF, textFieldPlaceHolder: "Full name")
      return container
   }()

   private lazy var usernameTFContainer: UIView = {
      let container = Utilities().inputContainerView(withImage: UIImage(named: "ic_person_outline_white_2x")!, textField: usernameTF, textFieldPlaceHolder: "Username")
      return container
   }()

   private let navigateToLoginButton: UIButton = {
      let button = Utilities().attributedButton("Already have an account ? ", "Sign IN")
      button.addTarget(self, action: #selector(navigateButtonTapped), for: .touchUpInside)
      return button
   }()

   private let activityIndicator: UIActivityIndicatorView = {
      let view = UIActivityIndicatorView()
      view.hidesWhenStopped = true
      view.color = .white

      return view
   }()

   private lazy var stack: UIStackView = {
      UIStackView(arrangedSubviews: [emailTFContainer, passwordTFContainer,
                                     fullnameTFContainer, usernameTFContainer])
   }()

   // MARK: lifecycle

   // MARK: selectors

   @objc func handlePickerTapped() {
      present(imagePickerController, animated: true)
   }

   @objc func handleRegister() {
      viewModel.registerButtonCallBack(email: emailTF.text,
                                       password: passwordTF.text,
                                       fullname: fullnameTF.text,
                                       userName: usernameTF.text) { [weak self] in
         self?.activityIndicator.startAnimating()

      } onServiceEnded: { [weak self] in
         self?.activityIndicator.stopAnimating()
         self?.dismiss(animated: true)
      }
   }

   @objc func navigateButtonTapped() {
      navigationController?.popViewController(animated: true)
   }

   override func viewDidLoad() {
      super.viewDidLoad()
      configureUI()
   }

   // MARK: helpers

   private func configureUI() {
      view.backgroundColor = .twitterBlue
      navigationItem.hidesBackButton = true
      imagePickerController.delegate = self
      imagePickerController.allowsEditing = true
      configureActivityIndicator()
      configureImagePickerView()
      configureTFStack()
      configureRegisterButton()
      configureNavigateButton()
   }

   fileprivate func configureActivityIndicator() {
      view.addSubview(activityIndicator)
      activityIndicator.centerX(inView: view)
      activityIndicator.centerY(inView: view)
   }

   fileprivate func configureImagePickerView() {
      view.addSubview(imagePickerViewButton)
      imagePickerViewButton.anchor(top: view.topAnchor, paddingTop: 70,
                                   width: 120, height: 120)
      imagePickerViewButton.centerX(inView: view)
   }

   fileprivate func configureTFStack() {
      stack.axis = .vertical
      stack.spacing = 40
      stack.distribution = .fillEqually
      view.addSubview(stack)
      stack.anchor(top: imagePickerViewButton.bottomAnchor, right: view.rightAnchor,
                   left: view.leftAnchor, paddingTop: 30, paddingRight: 40, paddingLeft: 40)
   }

   fileprivate func configureRegisterButton() {
      view.addSubview(registerButton)
      registerButton.anchor(top: stack.bottomAnchor, right: view.rightAnchor,
                            left: view.leftAnchor, paddingTop: 30,
                            paddingRight: 40, paddingLeft: 40, height: 40)
   }

   fileprivate func configureNavigateButton() {
      view.addSubview(navigateToLoginButton)
      navigateToLoginButton.anchor(bottom: view.safeAreaLayoutGuide
         .bottomAnchor, paddingBottom: 5)
      navigateToLoginButton.centerX(inView: view)
   }
}

extension RegisterController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   func imagePickerController(_ picker: UIImagePickerController,
                              didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any])
   {
      guard let profileImage = info[.editedImage] as? UIImage else { return }
      imagePickerViewButton.layer.cornerRadius = 60
      imagePickerViewButton.layer.masksToBounds = true
      imagePickerViewButton.imageView?.contentMode = .scaleAspectFill
      imagePickerViewButton.imageView?.clipsToBounds = true
      imagePickerViewButton.layer.borderColor = UIColor.white.cgColor
      imagePickerViewButton.layer.borderWidth = 3
      viewModel.profileImage = profileImage
      imagePickerViewButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
      dismiss(animated: true)
   }
}
