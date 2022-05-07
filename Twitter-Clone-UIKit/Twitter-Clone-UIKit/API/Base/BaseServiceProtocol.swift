//
//  BaseServiceProtocol.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 7.05.2022.
//

import Foundation
import FirebaseAuth

protocol BaseServiceProtocol {

   var auth : Auth { get }

func checkUserLoggedIn() -> Bool


}
