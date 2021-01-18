//
//  Settings.swift
//  hamdalah
//
//  Created by midn1ght on 1/15/21.
//

import UIKit

class Settings: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.tabBar.isHidden = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        
        let row = indexPath.row
        
        switch row {
        case 0:
            cell.textLabel?.text = "Daily Reminder"
        case 1:
            cell.textLabel?.text = "Rate Us"
        case 2:
            cell.textLabel?.text = "Privacy Policy"
        case 3:
            cell.textLabel?.text = "Terms of Service"
        default:
            break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        switch row {
        //case 0:
            //launch daily reminder view
            
        default:
            break
        }
    }

}
