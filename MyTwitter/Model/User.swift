//
//  User.swift
//  MyTwitter
//
//  Created by Dilyana Yankova on 7/24/18.
//  Copyright © 2018 Dilyana Yankova. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User {
    let name: String
    let username: String
    let bioText: String
    let profileImageUrl: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImageUrl = json["profileImageUrl"].stringValue
    }
}
