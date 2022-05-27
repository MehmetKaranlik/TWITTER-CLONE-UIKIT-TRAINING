//
//  ProfileTesting.swift
//  TwitterUnitTesting
//
//  Created by mehmet karanlık on 27.05.2022.
//

import XCTest

@testable import Twitter_Clone_UIKit

class ProfileTesting: XCTestCase {
   let testUID = "UftlGj9rzEc3F4XsY6tQ9zXj7Us1"
   let testTargetUID = "SAUDUT0VGvcLDeLyClSaY7t6acx1"
   let service = ProfileService()

   override func setUpWithError() throws {
      // Put setup code here. This method is called before the invocation of each test method in the class.
   }

   override func tearDownWithError() throws {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
   }

   func testUserByUID() throws {
      var result: BaseUserModel?
      service.returnUserByUID(uid: testUID) { user in
         result = user
         XCTAssert(result != nil)
      }

      func testFollowUser() throws {
         service
            .followUser(userUID: testUID,
                        targetUID: testTargetUID) { error, dbRef in
               XCTAssert(error == nil)
               XCTAssert(dbRef.key != nil &&  !dbRef.key!.isEmpty)
            }
      }

      func testFetchTweetsByUID() throws {
         service.fetchTweetsByUID(uid: testUID) { tweets in
            XCTAssert(!tweets.isEmpty)
            XCTAssert(tweets.allSatisfy({ tweet in
               tweets is Tweet
            }))
         }
      }



   }
}
