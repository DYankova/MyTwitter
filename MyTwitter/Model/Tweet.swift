//
//  Tweet.swift
//  MyTwitter
//
//  Created by Dilyana Yankova on 7/25/18.
//  Copyright © 2018 Dilyana Yankova. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Tweet { //struct is better to be used in small projects
    let user : User
    let message: String
    
    init(json: JSON){
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}
