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
//
