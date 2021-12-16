//
//  Group.swift
//  client-server
//
//  Created by yoji on 16.12.2021.
//

import Foundation
import Alamofire

// https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V


struct Group {
    var grName = "m"


}

final class GroupAPI {
    
    let baseURL = "https://api.vk.com/method"
    let userID = Session.shared.userID
    let accessToken = Session.shared.token
    let version = "5.131"
    
    func getGroup(completion: @escaping ([Group])->()) {
        
        let path = "/groups.get"
        let url = baseURL + path
        let params: [String: String] = [
            "user_id" : userID,
            "access_token" : accessToken,
            "v" : version,
//            "owner_id" : "-1",
//            "album_id" : "profile",
//            "rev" : "1",
//            "photo_sizes" : "0",
            "count" : "10",
            "extended" : "1",
            
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON {
            response in
            
            //print(response.result)
        }
        
        completion([Group()])
        
    }
}
