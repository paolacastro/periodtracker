//
//  LogViewController.swift
//  PeriodTracker
//
//  Created by Paola Castro on 5/30/20.
//  Copyright © 2020 Paola Castro. All rights reserved.
//

import UIKit

class LogViewController: UIViewController {
    
    var datePicker: UIDatePicker?
    @IBOutlet weak var periodDate: UITextField!
    @IBOutlet weak var instructionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(LogViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        periodDate.inputView = datePicker
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(LogViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        periodDate.text = dateFormatter.string(from: datePicker.date)
    }
    

}
