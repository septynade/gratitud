//
//  UpdateEntry.swift
//  hamdalah
//
//  Created by midn1ght on 1/14/21.
//

import UIKit

class UpdateEntry: UIViewController {

    //MARK: - Outlets
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var textView: UITextView!
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var deleteButton: UIBarButtonItem!
    
    //MARK: - Variables

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var entryToUpdate: Entry!
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.date = entryToUpdate.date!
        textView.text = entryToUpdate.text
        tabBarController?.tabBar.isHidden = true
    }

    //MARK: - Actions
    @IBAction func deleteTapped(_ sender: Any) {
        changeVC()
        context.delete(entryToUpdate)
        
        do {
            try context.save()
        } catch {
            //error
        }
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        entryToUpdate.date = datePicker.date
        entryToUpdate.text = textView.text
        
        do {
            try context.save()
            changeVC()
        } catch {
            //error
        }
    }
    
    
    //MARK: - Functions
    func changeVC() {
        let vc = storyboard?.instantiateViewController(identifier: "entriesView") as! EntriesView
        
        vc.modalPresentationStyle = .automatic
        vc.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - Extensions

