//
//  QuoteViewController.swift
//  hamdalah
//
//  Created by midn1ght on 1/8/21.
//

import UIKit

class DailyZen: UIViewController {

    //MARK: - Outlets
    @IBOutlet var zenView: UIView!
    @IBOutlet var zenLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var buttonsView: UIView!
    
    
    //MARK: - Variables
    
    var zenOfTheDay: String!
    var zenAuthor: String!
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setView()
    }
    
    //MARK: - Functions
    func setView() {
        zenView.layer.borderWidth = 2.5
        zenView.layer.borderColor = UIColor.label.cgColor
        
        buttonsView.layer.borderWidth = 2.5
        buttonsView.layer.borderColor = UIColor.label.cgColor
        
    }

}
