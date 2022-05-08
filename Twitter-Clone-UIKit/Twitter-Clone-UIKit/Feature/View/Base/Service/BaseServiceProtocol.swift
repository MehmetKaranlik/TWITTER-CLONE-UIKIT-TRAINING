//
//  BaseServiceProtocol.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 7.05.2022.
//

import FirebaseAuth
import Foundation

protocol BaseServiceProtocol {
   var auth: Auth { get }

   func checkUserLoggedIn() -> Bool
   func fetchCurrentUserData()
}
