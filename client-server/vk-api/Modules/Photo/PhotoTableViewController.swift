////
////  PhotoTableViewController.swift
////  client-server
////
////  Created by yoji on 16.12.2021.
////
//
//import UIKit
//import SDWebImage
//
//final class PhotoTableViewController: UITableViewController {
//    
//    private var photoAPI = PhotoAPI()
//    private var photo: [Photo] = []
//    private var size: [Size] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//
//        photoAPI.getPhoto { [weak self] photo in
//            guard let self = self else { return }
//            self.photo = photo
//            
//            self.tableView.reloadData()
//        }
//    }
//
//   
//
////   override func numberOfSections(in tableView: UITableView) -> Int {
////
////        return 0
////    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        return photo.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        
//        let photo = photo[indexPath.row]
//        cell.textLabel?.text = photo.text
//        
//        let size = size[indexPath.row]
//        
//        if let url = URL(string: size.url ) {
//            cell.imageView?.sd_setImage(with: url, completed: nil)
//            
//        }
//        return cell
//    }
//
//    
//}


import UIKit
import SDWebImage
import RealmSwift

class PhotosTableViewController: UITableViewController {

    private var photosApi = PhotoAPI()
    //private var photos = [PhotoDAO]() old
    private var imageView = UIImageView()
    private var photosDB = PhotosDB()
    private var photos: Results<PhotoDAO>?
    private var token: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PhotoCell")

        photosApi.getPhoto { [weak self] photos in

            guard let self = self else { return }

            self.photosDB.save(photos)
            self.photos = self.photosDB.fetch()
            
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let photos = photos else { return 0 }

        return photos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath)
        
        if let photo = photos?[indexPath.row] {
            var content = cell.defaultContentConfiguration()

            if let url = URL(string: photo.sizes.first!.url) {

                DispatchQueue.global().async { [weak self] in
                    do {
                        let imageData = try Data(contentsOf: url)
                        DispatchQueue.main.async {
                            self!.imageView.image = UIImage(data: imageData)}
                        print("Адрес картинки: \(url)")
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        //let photo: PhotoDAO = photos[indexPath.row]
        

//        content.text = String(photo.id)
//        content.image = imageView.image
//        content.imageProperties.cornerRadius = tableView.rowHeight / 2
//
//        cell.contentConfiguration = content

        return cell
    }
}
