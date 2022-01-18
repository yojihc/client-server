//
//  Friend.swift
//  client-server
//
//  Created by yoji on 21.12.2021.
//

import Foundation
import RealmSwift

// MARK: - FriendsConteiner
struct FriendsConteiner: Codable {
    let response: FriendResponse
}

// MARK: - Response
struct FriendResponse: Codable {
    let count: Int
    let items: [Friend]
}

// MARK: - Item
struct Friend: Codable {
    let id: Int
    let lastName: String
    //let canAccessClosed, isClosed: Bool?
    let firstName, trackCode: String
    //let deactivated: String?
    let photo100: String
    let photo50: String

    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        //case canAccessClosed = "can_access_closed"
        case photo100 = "photo_100"
        case photo50 = "photo_50"
        //case isClosed = "is_closed"
        case firstName = "first_name"
        case trackCode = "track_code"
        //case deactivated
    }
}
 

