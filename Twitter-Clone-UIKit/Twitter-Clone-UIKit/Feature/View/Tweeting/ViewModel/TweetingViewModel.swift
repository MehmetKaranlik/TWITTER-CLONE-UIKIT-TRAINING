//
//  TweetingViewModel.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 18.05.2022.
//

import Foundation
import FirebaseDatabase

class TweetingViewModel : ObservableObject {


   private let service = TweetingService()




   func uploadTweet(caption: String,
                    completion : @escaping (Bool)-> Void) {
      var returnBool : Bool?
      service.uploadTweet(caption: caption) { error, dbRef in
         if let _ = error {
            returnBool = false
            
         }else {
            returnBool = true
         }

        completion(returnBool ?? false)

      }

   }

}
