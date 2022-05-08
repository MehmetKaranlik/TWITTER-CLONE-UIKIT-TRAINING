//
//  RegisterServiceProtocol.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 6.05.2022.
//

import Foundation
import Firebase
import UIKit
import FirebaseDatabase
import FirebaseStorage

protocol RegisterServiceProtocol {

   var auth : Auth { get }
   var database : Database { get }
   var storage : Storage {get }


   func registerUser(email : String, password : String,
                     fullname: String, username: String,
                     userImage: UIImage?, onServiceComplete: @escaping () -> Void)


    func uploadUserImage(uid : String,userImage: UIImage, urlPath:  @escaping (String)-> Void)
   func downloadUrl(uid: String,passUrl: @escaping (String?)-> Void)
}
