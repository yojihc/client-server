//
//  PhotoAPI.swift
//  client-server
//
//  Created by yoji on 16.12.2021.
//

import Foundation
import Alamofire

// https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V


//struct Photo {
//    var image = "m"
//
//
//}

final class PhotoAPI {
    
    let baseURL = "https://api.vk.com/method"
    let userID = Session.shared.userID
    let accessToken = Session.shared.token
    let version = "5.131"
    
    func getPhoto(completion: @escaping ([Photo])->()) {
        
        let path = "/photos.get"
        let url = baseURL + path
        let params: [String: String] = [
            //"user_id" : userID,
            "access_token" : accessToken,
            "v" : version,
            "owner_id" : userID,
            "album_id" : "profile",
            //"no_service_albums" : "1",
            "rev" : "0",
            "photo_sizes" : "1",
            "count" : "3"
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON {
            response in
            
           //print(response.result)
            print(response.data?.prettyJSON)
            
        }
        
        //completion([Photo()])
        
    }
}

