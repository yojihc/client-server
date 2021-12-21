//
//  Photo.swift
//  client-server
//
//  Created by yoji on 21.12.2021.
//

//   let groupConteiner = try? newJSONDecoder().decode(GroupConteiner.self, from: jsonData)

import Foundation

// MARK: - GroupConteiner
struct PhotoConteiner: Codable {
    let response: PhotoResponse
}

// MARK: - Response
struct PhotoResponse: Codable {
    let count: Int
    let items: [Photo]
}

// MARK: - Item
struct Photo: Codable {
    let albumID, id, date: Int
    let text: String
    let userID: Int
    let sizes: [Size]
    let hasTags: Bool
    let ownerID: Int

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id, date, text
        case userID = "user_id"
        case sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
    }
}

// MARK: - Size
struct Size: Codable {
    let width, height: Int
    let url: String
    let type: String
}
