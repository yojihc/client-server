//
//  GroupTableViewController.swift
//  client-server
//
//  Created by yoji on 16.12.2021.
//

import UIKit

final class GroupTableViewController: UITableViewController {
    
    private var groupAPI = GroupAPI()
    private var group: [Group] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        groupAPI.getGroup { [weak self] group in
            guard let self = self else { return }
            self.group = group
            
            self.tableView.reloadData()
        }
    }

   

//   override func numberOfSections(in tableView: UITableView) -> Int {
//
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return group.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = group[indexPath.row].grName
        
        return cell
    }

    
}

