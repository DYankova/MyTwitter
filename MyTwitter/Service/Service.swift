//
//  Service.swift
//  MyTwitter
//
//  Created by Dilyana Yankova on 8/1/18.
//  Copyright © 2018 Dilyana Yankova. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service{
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completeion: @escaping (HomeDatasource?, Error?) -> ()){
        //start json fetch here using alomofire and tron
        //<?,?> generics
        
        let request: APIRequest <HomeDatasource, JSError> = tron.swiftyJSON.request("/twitter/home")
        request.perform(withSuccess: { (homeDatasource) in
            completeion(homeDatasource, nil)// оnly optionals are allowed to be nil
            print("fetched!")
        }) { (err) in
            completeion(nil, err)
            print("error!")
        }
    }
    
    class JSError: JSONDecodable {
        required init(json: JSON) throws {
            print("error")
        }
    }
}
