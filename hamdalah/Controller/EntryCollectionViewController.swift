//
//  EntryCollectionViewController.swift
//  hamdalah
//
//  Created by midn1ght on 1/8/21.
//

import UIKit

class EntryCollectionViewController: UICollectionViewController {

    //MARK: - Variables
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var entries = [Entry]()
    
    let df = DateFormatter()
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Hamdalah"
        //navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
        fetchEntries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if context.hasChanges {
            fetchEntries()
        }
    }
    

    //MARK: - CollectionView configs
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entries.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:  IndexPath) -> UICollectionViewCell {
        let entry = entries[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EntryCell.identifier, for: indexPath) as! EntryCell
        let cellColor = UIColor(red: 1.00, green: 0.81, blue: 0.62, alpha: 1.00)
        
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.shadowColor = UIColor.black.cgColor
        cell.contentView.layer.shadowOpacity = 0.8
        cell.contentView.layer.shadowRadius = 5
        cell.contentView.layer.shadowOffset = CGSize(width: 0, height: 10)
        
        cell.contentView.backgroundColor = cellColor
        cell.dateLabel.textColor = .white
        cell.monthLabel.textColor = .white
        cell.previewLabel.textColor = .white
        
        cell.previewLabel.text = entry.text
        //cell.dateLabel.text = df.string(from: entry.date)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let entry = entries[indexPath.row]
        performSegue(withIdentifier: "toEntry", sender: entry)
    }
    
    //MARK: - Actions
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: "toEntry", sender: self)
    }
    
    
    //MARK: - Functions
    func fetchEntries() {
        do {
            entries = try context.fetch(Entry.fetchRequest())
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } catch {
            //error
        }
    }

}
