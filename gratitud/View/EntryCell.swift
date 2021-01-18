//
//  EntryCollectionViewCell.swift
//  hamdalah
//
//  Created by midn1ght on 1/8/21.
//

import UIKit

class EntryCell: UITableViewCell {
    
    static let identifier = "EntryCell"
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var previewLabel: UILabel!
    
    func setCell(entry: Entry) {
        
        previewLabel.text = entry.text
        dateLabel.text = entry.fullDate()
    }
}
