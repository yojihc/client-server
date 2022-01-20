//
//  GroupTableViewController.swift
//  client-server
//
//  Created by yoji on 16.12.2021.
//

import UIKit
import SDWebImage
import RealmSwift

final class GroupTableViewController: UITableViewController {
    
    private var groupAPI = GroupAPI()
    // private var group: [GroupDAO] = [] old
    private var groupsDB = GroupDB()
    private var groups: Results<GroupDAO>?
    private var token: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        groupAPI.getGroup { [weak self] group in
            guard let self = self else { return }
           // self.group = group
            
            self.groupsDB.save(groups)
            self.groups = self.groupsDB.fetch()
            
            self.token = self.groups?.observe(on: .main, { [weak self] changes in
                
                guard let self = self else { return }
                
                switch changes {
                case .initial: self.tableView.reloadData()
                case .update(_, let deletions, let insertions, let modifications):
                    self.tableView.beginUpdates()
                    self.tableView.insertRows(at: insertions.map({IndexPath(row: $0, section: $0)}), with: .automatic)
                    self.tableView.deleteRows(at: deletions.map({IndexPath(row: $0, section: $0)}), with: .automatic)
                    self.tableView.reloadRows(at: modifications.map({IndexPath(row: $0, section: $0)}), with: .automatic)
                    self.tableView.endUpdates()
                    
                case .error(let error):
                    print(error)
                }
            })
        }
    }

   

   override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let groups = groups else { return 0}
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //let group: GroupDAO = group[indexPath.row]
        if let group = groups?[indexPath.row] {
            cell.textLabel?.text = "\(group.name)"
            
            if let url = URL(string: group.photo100) {
                cell.imageView?.sd_setImage(with: url, completed: nil)
                
            }
        }
        
        return cell
    }

    
}

