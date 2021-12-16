//
//  PhotoTableViewController.swift
//  client-server
//
//  Created by yoji on 16.12.2021.
//

import UIKit

final class PhotoTableViewController: UITableViewController {
    
    private var photoAPI = PhotoAPI()
    private var photo: [Photo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        photoAPI.getPhoto { [weak self] photo in
            guard let self = self else { return }
            self.photo = photo
            
            self.tableView.reloadData()
        }
    }

   

//   override func numberOfSections(in tableView: UITableView) -> Int {
//
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return photo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = photo[indexPath.row].image
        
        return cell
    }

    
}

