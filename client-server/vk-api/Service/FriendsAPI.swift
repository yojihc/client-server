//
//  FriendsAPI.swift
//  client-server
//
//  Created by yoji on 16.12.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

// https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V


//struct Friend {
//    var name = "master tester 3000"
//
//
//}

final class FriendsAPI {
    
    
    func getFriends(completion: @escaping ([Friend])->()) {
        
        let baseURL = "https://api.vk.com/method"
        let userID = Session.shared.userID
        let accessToken = Session.shared.token
        let version = "5.81"
        
        
        let path = "/friends.get"
        let url = baseURL + path
        let params: [String: String] = [
            "user_id" : userID,
            "order" : "name",
            "count" : "100",
            "fields" : "photo_50, photo_100",
            "access_token" : accessToken,
            "v" : version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON {
            response in
            
            //print(response.result)
            //print(response.data?.prettyJSON)
            guard let jsonData = response.data else { return }
            
            let friendsConteiner = try? JSONDecoder().decode(FriendsConteiner.self, from: jsonData)
            
            guard let friend = friendsConteiner?.response.items else { return }
            
            completion(friend)
        }
        
        //completion([Friend()])
        
    
    }
    func getFriends2(completion: @escaping ([FriendDAO])->()) {
        
        let baseURL = "https://api.vk.com/method"
        let userID = Session.shared.userID
        let accessToken = Session.shared.token
        let version = "5.81"
        
        
        let path = "/friends.get"
        let url = baseURL + path
        let params: [String: String] = [
            "user_id" : userID,
            "order" : "name",
            "count" : "100",
            "fields" : "photo_50, photo_100",
            "access_token" : accessToken,
            "v" : version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in

                            print(response.data?.prettyJSON)

                            guard let jsonData = response.data else { return }

                            do {

                                let itemsData = try JSON(jsonData)["response"]["items"].rawData()
                                let friends = try JSONDecoder().decode([FriendDAO].self, from: itemsData)

                                completion(friends)
                            } catch {
                                print(error)
                            }
    
    
}

}
}

