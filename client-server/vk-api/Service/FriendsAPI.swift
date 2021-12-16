//
//  FriendsAPI.swift
//  client-server
//
//  Created by yoji on 16.12.2021.
//

import Foundation
import Alamofire

// https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V


struct Friend {
    var name = "master tester 3000"
    
    
}

final class FriendsAPI {
    
    let baseURL = "https://api.vk.com/method"
    let userID = Session.shared.userID
    let accessToken = Session.shared.token
    let version = "5.131"
    
    func getFriends(completion: @escaping ([Friend])->()) {
        
        let path = "/friends.get"
        let url = baseURL + path
        let params: [String: String] = [
            "user_id" : userID,
            "order" : "name",
            "count" : "5",
            "fields" : "photo100",
            "access_token" : accessToken,
            "v" : version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON {
            response in
            
           // print(response.result)
        }
        
        completion([Friend()])
        
    }
}
