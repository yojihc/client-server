//
//  GroupSearch.swift
//  client-server
//
//  Created by yoji on 16.12.2021.
//

import UIKit

final class GroupSearchTableViewController: UITableViewController {
    
    private var searchAPI = SearchAPI()
    private var search: [Search] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        searchAPI.getSearch { [weak self] search in
            guard let self = self else { return }
            self.search = search
            
            self.tableView.reloadData()
        }
    }

   

//   override func numberOfSections(in tableView: UITableView) -> Int {
//
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return search.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = search[indexPath.row].searchName
        
        return cell
    }

    
}


