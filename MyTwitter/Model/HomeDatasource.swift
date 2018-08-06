//
//  HomeDatasource.swift
//  MyTwitter
//
//  Created by Dilyana Yankova on 7/23/18.
//  Copyright © 2018 Dilyana Yankova. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    
    required init(json: JSON) throws {

        guard let usersJsonArray = json["users"].array else {
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "users is not valid json"]) //guard = if not
        }   //parse it from json and map
        self.users = usersJsonArray.map({return User(json: $0)})
        
//        for userJson in usersJsonArray!{
//            let user = User(json: userJson)
//            users.append(user)
//        }
             guard let tweetJsonArray = json["tweets"].array else {
              throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "tweets is not valid json"])
        }
        self.tweets = tweetJsonArray.map({Tweet(json: $0)})
    }
    
    let tweets: [Tweet]
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self] //for the second sections
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item] //everytime the datasource item is called it calles this method
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }    
}
