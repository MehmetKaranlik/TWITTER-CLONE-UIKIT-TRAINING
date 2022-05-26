//
//  ExploreServiceProtocol.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 25.05.2022.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth


protocol ExploreServiceProtocol {
   var database : Database { get }
   var auth : Auth { get}

   func fetchUserByInput(input : String, completion : @escaping ([BaseUserModel]) -> Void)
}
