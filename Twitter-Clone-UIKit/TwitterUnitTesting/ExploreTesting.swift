//
//  ExploreTesting.swift
//  TwitterUnitTesting
//
//  Created by mehmet karanlık on 27.05.2022.
//

import XCTest

@testable import Twitter_Clone_UIKit

class ExploreTesting: XCTestCase {
   let service = FeedService()
   let testUID = "UftlGj9rzEc3F4XsY6tQ9zXj7Us1"


    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }


   func testTweetFetching() throws {
      service.fetchTweets { tweet in
         XCTAssert(tweet.uid != nil &&
                   tweet.caption != nil &&
                   !tweet.tweetID!.isEmpty &&
                   tweet.likes! >= 0 &&
                   tweet.retweets! >= 0)
      }
   }

   func testFetchingUser() throws {
      service.returnProfileImageOfTweetUser(testUID) { user in
         XCTAssert(
            user.followings != nil &&
            user.followers != nil &&
            user.profileImagePath != nil &&
            user.fullname != nil &&
            user.password != nil && 
            user.username != nil
         )
      }
   }



}
