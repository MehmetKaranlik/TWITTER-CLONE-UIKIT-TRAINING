//
//  FeedServiceProtocol.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 18.05.2022.
//

import Foundation
import FirebaseDatabase



protocol FeedServiceProtocol {

   var database : Database { get }

   func fetchTweets(completion : @escaping (Tweet)-> Void)
}
