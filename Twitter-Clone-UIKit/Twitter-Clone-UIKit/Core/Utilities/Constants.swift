//
//  Constants.swift
//  Twitter-Clone-UIKit
//
//  Created by mehmet karanlık on 7.05.2022.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseDatabase


let DB_REF = Database.database().reference()
let USERS_DB_REF = DB_REF.child("users")
let STORAGE_REF = Storage.storage().reference()
let PROFILE_IMAGE_REF = STORAGE_REF.child("profileImage")
let TWEET_DB_REF = DB_REF.child("tweets")
let USER_FOLLOWING_DB = DB_REF.child("user_following")
let USER_FOLLOWERS_DB = DB_REF.child("user_followers")


