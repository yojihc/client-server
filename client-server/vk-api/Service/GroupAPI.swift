//
//  Group.swift
//  client-server
//
//  Created by yoji on 16.12.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

// https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V


//struct Group {
//    var grName = "m"
//
//
//}

final class GroupAPI {
    
    let baseURL = "https://api.vk.com/method"
    let userID = Session.shared.userID
    let accessToken = Session.shared.token
    let version = "5.81"
    
    func getGroup(completion: @escaping ([GroupDAO])->()) {
        
        let path = "/groups.get"
        let url = baseURL + path
        let params: [String: String] = [
            "user_id" : userID,
            "access_token" : accessToken,
            "v" : version,
            "count" : "100",
            "extended" : "1",
            
        ]
        
        AF.request(url,method: .get, parameters: params).responseJSON { response in

            print("GROUPS RESPONSE.DATA: \(response.data?.prettyJSON)")
                  guard let jsonData = response.data else { return }
                           
            do {
                let itemsData = try JSON(jsonData)["response"]["items"].rawData()
                let groups = try JSONDecoder().decode([GroupDAO].self, from: itemsData)
                completion(groups)
                
            } catch {
                    print(error)
        }
    }
        
        
      
        
    }
}
