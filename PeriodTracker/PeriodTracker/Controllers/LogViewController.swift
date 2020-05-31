//
//  LogViewController.swift
//  PeriodTracker
//
//  Created by Paola Castro on 5/30/20.
//  Copyright © 2020 Paola Castro. All rights reserved.
//

import UIKit
import RealmSwift

class LogViewController: UIViewController {
    
    var realm = try! Realm()
    
    var periodLogEntryObjects: Results<PeriodLogEntry>?
    var currentPeriodEntry: PeriodLogEntry?
    
    var datePicker: UIDatePicker?
    
    @IBOutlet weak var displayDateTextField: UITextField!
    
    @IBOutlet weak var instructionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(LogViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        displayDateTextField.inputView = datePicker
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(LogViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        periodLogEntryObjects = realm.objects(PeriodLogEntry.self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        if let loggedEntry = periodLogEntryObjects!.first {
            displayDateTextField.text = dateFormatter.string(from: loggedEntry.date)
        } else {
            displayDateTextField.text = "Select your period start date"
        }
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        displayDateTextField.text = dateFormatter.string(from: datePicker.date)
        
        if let loggedEntry = periodLogEntryObjects!.first {
            do {
                try realm.write {
                    loggedEntry.date = datePicker.date
                }
            } catch  {
                print("saving: \(error)")
            }
            
        } else {
            // if there hasn't been a period saved
            let newPeriod = PeriodLogEntry()
            newPeriod.date = datePicker.date
            do {
                try realm.write {
                    realm.add(newPeriod)
                }
            } catch  {
                print("saving: \(error)")
            }
            
        }
        
    }
    

}
