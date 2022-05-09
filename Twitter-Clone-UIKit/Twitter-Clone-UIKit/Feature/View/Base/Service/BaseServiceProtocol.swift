//
//  BaseServiceProtocol.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 7.05.2022.
//

import FirebaseAuth
import Foundation
import FirebaseDatabase
protocol BaseServiceProtocol {
   var auth: Auth { get }
   var database : Database { get }

   func checkUserLoggedIn() -> Bool
   func fetchCurrentUserData(completionHandler: @escaping (BaseUserModel) -> Void)
}
