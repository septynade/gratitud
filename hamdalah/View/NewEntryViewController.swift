//
//  NewEntryViewController.swift
//  hamdalah
//
//  Created by midn1ght on 1/8/21.
//

import UIKit

class NewEntryViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var textView: UITextView!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    //MARK: - Variables
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    let pholderArray = ["What are you grateful for today?", "What makes you happy?", "What makes you smile today?"]
    let df = DateFormatter()
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        df.dateFormat = "MMMM dd"
        let initDate = df.string(from: datePicker.date)
        navigationItem.title = "New entry for \(initDate)"
        
        
        textView.delegate = self
        let placeholder = pholderArray.randomElement()
        //textView.text = placeholder
        textView.textColor = .lightGray
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //save data when user tap back
        
    }
    
    //MARK: - Actions
    @IBAction func saveTapped(_ sender: Any) {
        saveEntry()
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
extension NewEntryViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if !textView.text.isEmpty {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = pholderArray.randomElement()
            textView.textColor = UIColor.lightGray
        }
    }
}
