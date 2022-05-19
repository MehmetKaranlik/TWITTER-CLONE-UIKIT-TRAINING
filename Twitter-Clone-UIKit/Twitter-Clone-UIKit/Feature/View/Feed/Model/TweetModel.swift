//
//  TweetModel.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 18.05.2022.
//

import Foundation


struct Tweet : Codable {
    let caption,uid,tweetID : String?
    let likes,retweets : Int?
    let timestamp: Date?

   init(tweetID: String,dictionary: [String: Any?]) {
      self.tweetID = tweetID
      self.caption = dictionary["caption"] as? String ?? ""
      self.uid = dictionary["uid"] as? String ?? ""
      self.likes = dictionary["likes"] as? Int ?? 0
      self.retweets = dictionary["retweets"] as? Int ?? 0
      if let timestamp =  dictionary["timestamp"] as? TimeInterval {
         self.timestamp = Date(timeIntervalSince1970: timestamp)
      }else {
         timestamp = Date.now
      }
   }
}
