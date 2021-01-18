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
    
    var zen: [Zen] = []
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchDailyZen()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setView()
    }
    
    //MARK: - Functions
    func setView() {
        zenView.layer.backgroundColor = UIColor(red: 1.00, green: 0.81, blue: 0.62, alpha: 1.00).cgColor
        
        buttonsView.layer.backgroundColor = UIColor.systemFill.cgColor
        
        fetchDailyZen()
    }
    
    func fetchDailyZen() {
        if let url = URL(string: "https://zenquotes.io/api/random") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { [self] (data, response, error) in
                if error != nil {
                    print("Error getting daily zen from API")
                } else if data != nil {
                    do {
                        zen = try JSONDecoder().decode([Zen].self, from: data!)
                        DispatchQueue.main.async {
                            zenLabel.text = "\u{22}\(zen.first!.q)\u{22}"
                            authorLabel.text = zen.first?.a
                        }
                    } catch {
                        //error
                        print("Error decoding zen\(error)")
                    }
                }
            }.resume()
        }
    }
    
    //MARK: - Actions
    @IBAction func copyTapped(_ sender: Any) {
        UIPasteboard.general.string = "\(zenLabel.text!) - \(authorLabel.text!)"
    }
    
    @IBAction func shareTapped(_ sender: Any) {
    }
    
    
}
