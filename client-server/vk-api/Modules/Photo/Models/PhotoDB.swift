//
//  PhotoDB.swift
//  client-server
//
//  Created by yoji on 18.01.2022.
//


import Foundation
import RealmSwift

// MARK: - Item
struct PhotoDTO: Codable {

    let albumID, id, date: Int
    let postID: Int?
    let text: String?
    let lat: Double?
    let sizes: [SizeDTO]
    let ownerID: Int
    let long: Double?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case postID = "post_id"
        case id, date, text, lat, sizes
        case ownerID = "owner_id"
        case long
    }
}

// MARK: - Size
struct SizeDTO: Codable {
    let width, height: Int
    let url: String
    let type: String
}

// MARK: - Model for storage
class PhotoDAO: Object, Codable {
    @objc dynamic var text: String?
    @objc dynamic var albumID = 0
    @objc dynamic var id = 0
    @objc dynamic var date = 0
    @objc dynamic var postID = 0
    @objc dynamic var lat: Double = 0
    var sizes: [SizeDAO]
    @objc dynamic var ownerID = 0
    @objc dynamic var long: Double = 0

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case postID = "post_id"
        case id, date, text, lat, sizes
        case ownerID = "owner_id"
        case long
    }
}

class SizeDAO: Object, Codable {
    @objc dynamic var width = 0
    @objc dynamic var height: Int = 0
    @objc dynamic var url: String = ""
    @objc dynamic var type: String = ""
}


final class PhotosDB {
    init(){
    
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 1)
    }
    
    func save (_ items: [PhotoDAO]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(items)
        }
        
        guard let url = realm.configuration.fileURL else { return }
        print(url)
    }
    
    func fetch() -> Results<PhotoDAO> {
        let realm = try! Realm()
        let friends: Results<PhotoDAO> = realm.objects(PhotoDAO.self)
        return friends
        
    }
    
    func deleteAll() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func delete(_ item: PhotoDAO) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(item)
        }
    }
}
