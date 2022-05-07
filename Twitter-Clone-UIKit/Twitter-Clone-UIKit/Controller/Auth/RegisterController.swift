//
//  RegisterController.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 5.05.2022.
//

import UIKit

protocol RegisterControllerDelegate : AnyObject {
   func navigateButtonCallBack()
   func pickerButtonCallBack()
   func registerButtonCallBack()
}

class RegisterController: UIViewController {
   // MARK: properties
   let viewModel = RegisterViewModel()
   let registerView = RegisterView()
   private let imagePickerController = UIImagePickerController()
   // MARK: lifecycle
   override func loadView() {
      configureController()
      view = registerView
   }

   // MARK: helpers
   private func configureController() {
      registerView.delegate = self
      navigationItem.hidesBackButton = true
      imagePickerController.delegate = self
      imagePickerController.allowsEditing = true

   }


}

extension RegisterController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   func imagePickerController(_ picker: UIImagePickerController,
                              didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any])
   {
      guard let profileImage = info[.editedImage] as? UIImage else { return }
  registerView.imagePickerViewButton.layer.cornerRadius = 60
  registerView.imagePickerViewButton.layer.masksToBounds = true
  registerView.imagePickerViewButton.imageView?.contentMode = .scaleAspectFill
  registerView.imagePickerViewButton.imageView?.clipsToBounds = true
  registerView.imagePickerViewButton.layer.borderColor = UIColor.white.cgColor
  registerView.imagePickerViewButton.layer.borderWidth = 3
      viewModel.profileImage = profileImage
  registerView.imagePickerViewButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
      dismiss(animated: true)
   }
}

extension RegisterController : RegisterControllerDelegate {
   func pickerButtonCallBack() {
      present(imagePickerController, animated: true)
   }

   func registerButtonCallBack() {
      viewModel.registerButtonCallBack(email: registerView.emailTF.text,
                                       password:  registerView.passwordTF.text,
                                       fullname:  registerView.fullnameTF.text,
                                       userName:  registerView.usernameTF.text) { [weak self] in
         self?.registerView.activityIndicator.startAnimating()

      } onServiceEnded: { [weak self] in
         self?.registerView.activityIndicator.stopAnimating()
         self?.navigationController?.popViewController(animated: true)
      }
   }

   func navigateButtonCallBack() {
      navigationController?.popViewController(animated: true)
   }
}
