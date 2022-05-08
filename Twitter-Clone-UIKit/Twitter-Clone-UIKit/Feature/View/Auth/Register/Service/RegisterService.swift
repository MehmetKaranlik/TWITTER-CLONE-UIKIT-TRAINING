//
//  RegisterService.swift
//  Twitter-Clone-UIKit
//  Created by mehmet karanlık on 6.05.2022.
//

import Firebase
import FirebaseStorage
import Foundation
import UIKit

struct RegisterService: RegisterServiceProtocol {


   var storage: Storage = .storage()
   var database: Database = .database()
   var auth: Auth = .auth()

   func registerUser(email: String, password: String,
                     fullname: String, username: String,
                     userImage: UIImage?, onServiceComplete: @escaping () -> Void)
   {
      // create user
      auth.createUser(withEmail: email, password: password) { result, error in

         if let error = error {
            print("something went wrong with user creation : \(error.localizedDescription)")
            return
         }
         guard let uid = result?.user.uid else { return }
         var values = ["email": email, "password": password,
                       "fullname": fullname, "username": username]

         // with user image
         if let userImage = userImage {
            uploadUserImage(uid: uid, userImage: userImage) { imagePath in

               values["profileImagePath"] = imagePath

               USERS_DB_REF.child(uid).updateChildValues(values) { error, _ in
                  if let error = error {
                     print("user didnt got created : \(error.localizedDescription)")
                     return
                  }
                  onServiceComplete()
               }
            }
         }
         // without user image
         else {
            values["profileImagePath"] = Utilities().profileImagePlaceHolderUrl
            USERS_DB_REF.child(uid).updateChildValues(values) { error, _ in
               if let error = error {
                  print("user didnt got created : \(error.localizedDescription)")
                  return
               }
               onServiceComplete()
            }
         }
      }
   }

   internal func uploadUserImage(uid: String, userImage: UIImage, urlPath: @escaping (String) -> Void) {
      guard let imageData = userImage.jpegData(compressionQuality: 0.2) else { return }
      PROFILE_IMAGE_REF.child(uid).putData(imageData) { _, error in
         if let error = error {
            print("something went wrong with uploading image : \(error.localizedDescription)")
            return
         }
         // fetch image url from bucket
         downloadUrl(uid: uid) { url in
            guard let imagePath = url else { return }
            urlPath(imagePath)
         }
      }
   }


   internal func downloadUrl(uid: String,passUrl: @escaping (String?)-> Void) {
      PROFILE_IMAGE_REF.child(uid).downloadURL { url, error in
         if let _ = error {
            return
         }
         passUrl(url?.absoluteString)
      }
   }
}
