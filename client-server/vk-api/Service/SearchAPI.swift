//
//  Group.swift
//  client-server
//
//  Created by yoji on 16.12.2021.
//

import Foundation
import Alamofire

// https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V


struct Search {
    var searchName = "m"


}

final class SearchAPI {
    
    let baseURL = "https://api.vk.com/method"
    let userID = Session.shared.userID
    let accessToken = Session.shared.token
    let version = "5.131"
    
    func getSearch(completion: @escaping ([Search])->()) {
        
        let path = "/groups.search"
        let url = baseURL + path
        let params: [String: String] = [
            "user_id" : userID,
            "access_token" : accessToken,
            "v" : version,
            "q" : "geekbrains",
            "count" : "3"
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON {
            response in
            
            print(response.result)
        }
        
        completion([Search()])
        
    }
}
