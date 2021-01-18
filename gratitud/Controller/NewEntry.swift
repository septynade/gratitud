//
//  NewEntryViewController.swift
//  hamdalah
//
//  Created by midn1ght on 1/8/21.
//

import UIKit

class NewEntry: UIViewController {

    //MARK: - Outlets
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var textView: UITextView!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    //MARK: - Variables
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //var entry: Entry?
    
    let pholderArray = ["What are you grateful for today?", "What makes you happy?", "What made you smile today?", "Think about happy thoughts..."]
    let df = DateFormatter()
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        df.dateFormat = "MMM d, YYYY"
        let initDate = df.string(from: datePicker.date)
        navigationItem.title = "New entry for \(initDate)"
        
        
        textView.delegate = self
        let placeholder = pholderArray.randomElement()
        textView.text = placeholder
        textView.textColor = .lightGray
        
        tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //save data when user tap back
        
    }
    
    //MARK: - Actions
    @IBAction func saveTapped(_ sender: Any) {
        saveEntry()
        let vc = storyboard?.instantiateViewController(identifier: "entriesView") as! EntriesView
        vc.navigationItem.hidesBackButton = true
        vc.modalPresentationStyle = .currentContext
        navigationController?.pushViewController(vc, animated: true)
        //performSegue(withIdentifier: "toEntries", sender: self)
    }
    
    @IBAction func dateChanged(_ sender: Any) {
        let dateOnTitle = df.string(from: datePicker.date)
        navigationItem.title = "New entry for \(dateOnTitle)"
    }
    
    
    
    //MARK: - Functions
    func saveEntry() {
        let newEntry = Entry(context: context)
        newEntry.text = textView.text
        newEntry.date = datePicker.date
        
        do {
            try self.context.save()
            
        } catch {
            //error saving new entry
        }
    }
    
}

//MARK: - Extensions
extension NewEntry: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            if traitCollection.userInterfaceStyle == .light {
                textView.textColor = .black
            } else {
                textView.textColor = .white
            }
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if !textView.text.isEmpty {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
        
        /*else if textView.textColor == UIColor.black {
            textView.text = pholderArray.randomElement()
            textView.textColor = UIColor.lightGray
            saveButton.isEnabled = false
        } else if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        } */
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = pholderArray.randomElement()
            textView.textColor = UIColor.lightGray
        }
    }
}
