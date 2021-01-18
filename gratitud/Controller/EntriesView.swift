//
//  EntryCollectionViewController.swift
//  hamdalah
//
//  Created by midn1ght on 1/8/21.
//

import CoreData
import UIKit

class EntriesView: UITableViewController {
    //MARK: - Outlets
    @IBOutlet var titleButton: UIBarButtonItem!
    
    
    //MARK: - Variables
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var entries = [Entry]()
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = false
        fetchEntries()
        
        /*
         screenSize = UIScreen.main.bounds
         screenWidth = screenSize.width
         screenHeight = screenSize.height
         */
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchEntries()
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if context.hasChanges {
            fetchEntries()
        }
        
    }
    
    
    //MARK: - Tableview configs
    override func numberOfSections(in tableView: UITableView) -> Int {
        return entries.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entry = entries[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: EntryCell.identifier, for: indexPath) as! EntryCell
        
        //cell.backgroundColor = UIColor(red: 1.00, green: 0.81, blue: 0.62, alpha: 1.00)
        
        cell.setCell(entry: entry)
        
        return cell
    }
    
    /* override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "EntryCell") as! EntryCell
        
    } */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = entries[indexPath.section]
        let vc = storyboard?.instantiateViewController(identifier: "updateEntry") as! UpdateEntry
        
        //vc.navigationItem.backButtonTitle = "Cancel"
        vc.modalPresentationStyle = .currentContext
        //vc.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)
        
        vc.entryToUpdate = entry
        //vc.textView.text = entry.text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: - Actions
    @IBAction func addTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "newEntry") as! NewEntry
        navigationController?.pushViewController(vc, animated: true)    }
    
    @IBAction func gearTapped(_ sender: Any) {
        performSegue(withIdentifier: "toSettings", sender: self)
    }
    
    @IBAction func titleTapped(_ sender: Any) {
        
    }
    
    
    //MARK: - Functions
    func fetchEntries() {
        do {
            let request = Entry.fetchRequest() as NSFetchRequest<Entry>
            let sort = NSSortDescriptor(key: "date", ascending: false)
            request.sortDescriptors = [sort]
            
            entries = try context.fetch(request)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            //error
        }
    }
    
}
