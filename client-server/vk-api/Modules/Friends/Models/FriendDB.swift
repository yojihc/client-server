//
//  FriendDB.swift
//  client-server
//
//  Created by yoji on 18.01.2022.
//

import Foundation
import RealmSwift

// MARK: - Item
struct FriendDTO: Codable {
    let id: Int
    let lastName: String
    let photo50: String
    let photo100: String
    let trackCode: String?
    let firstName: String

    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case trackCode = "track_code"
        case firstName = "first_name"
    }
}

// MARK: - Model for storage
class FriendDAO: Object, Codable {
    @objc dynamic var lastName = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var photo50: String = ""
    @objc dynamic var photo100: String = ""
    @objc dynamic var trackCode: String?
    @objc dynamic var firstName: String = ""

    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case trackCode = "track_code"
        case firstName = "first_name"
    }
}


final class FriendDB {
    init(){
    
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 1)
    }
    
    func save (_ items: [FriendDAO]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(items)
        }
        
        guard let url = realm.configuration.fileURL else { return }
        print(url)
    }
    
    func fetch() -> Results<FriendDAO> {
        let realm = try! Realm()
        let friends: Results<FriendDAO> = realm.objects(FriendDAO.self)
        return friends
        
    }
    
    func deleteAll() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func delete(_ item: FriendDAO) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(item)
        }
    }
}
