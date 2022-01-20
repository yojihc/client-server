//
//  GroupDB.swift
//  client-server
//
//  Created by yoji on 18.01.2022.
//

import Foundation
import RealmSwift

// MARK: - Item
struct GroupDTO: Codable {
    let isMember, id: Int
    let photo100: String
    let isAdvertiser, isAdmin: Int
    let photo50, photo200: String
    let type, screenName, name: String
    let isClosed: Int

    enum CodingKeys: String, CodingKey {
        case isMember = "is_member"
        case id
        case photo100 = "photo_100"
        case isAdvertiser = "is_advertiser"
        case isAdmin = "is_admin"
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case type
        case screenName = "screen_name"
        case name
        case isClosed = "is_closed"
    }
}

// MARK: - Model for storage
class GroupDAO: Object, Codable {
    @objc dynamic var isMember = 0
    @objc dynamic var id = 0
    @objc dynamic var isAdvertiser = 0
    @objc dynamic var isAdmin = 0
    @objc dynamic var name = ""
    @objc dynamic var screenName = ""
    @objc dynamic var photo100 = ""
    @objc dynamic var photo50 = ""
    @objc dynamic var photo200 = ""
    @objc dynamic var type = ""
    @objc dynamic var isClosed = 0

    enum CodingKeys: String, CodingKey {
        case isMember = "is_member"
        case id
        case photo100 = "photo_100"
        case isAdvertiser = "is_advertiser"
        case isAdmin = "is_admin"
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case type
        case screenName = "screen_name"
        case name
        case isClosed = "is_closed"
    }
}


final class GroupDB {
    init(){
    
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 1)
    }
    
    func save (_ items: [GroupDAO]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(items)
        }
        
        guard let url = realm.configuration.fileURL else { return }
        print(url)
    }
    
    func fetch() -> Results<GroupDAO> {
        let realm = try! Realm()
        let friends: Results<GroupDAO> = realm.objects(GroupDAO.self)
        return friends
        
    }
    
    func deleteAll() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func delete(_ item: GroupDAO) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(item)
        }
    }
}
