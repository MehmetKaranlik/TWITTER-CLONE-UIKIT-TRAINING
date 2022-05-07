//
//  LoginServiceProtocol.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 7.05.2022.
//

import Foundation
import Firebase
import FirebaseAuth



protocol LoginServiceProtocol {

   var auth : Auth { get }


   func loginUser(email : String, password : String,
                  onFail : @escaping (Bool) -> Void, onSuccess: @escaping (Bool) -> Void )
}
