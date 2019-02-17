//
//  AddCounterViewController.swift
//  CounterApp
//
//  Created by ivan piskun on 2/17/19.
//  Copyright © 2019 ivan piskun. All rights reserved.
//

import UIKit
import CoreData

class AddCounterViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties

    @IBOutlet weak var nameText: UITextField! {
        didSet {
            nameText.textFieldPreferences()
        }
    }
    
   
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // set up delegates
        nameText.delegate = self
        
        
        stepper.autorepeat = true
        //stepper.maximumValue = 1000
        
        
        saveButton.isEnabled = false 
        nameText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange (_ textField:UITextField) {
        if let name = nameText.text {
            if !name.isEmpty {
                saveButton.isEnabled = true
            } else {
                saveButton.isEnabled = false
            }
            
        }
    }
    

    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let counterItem = Counters(context: context)
        
        
        counterItem.name = nameText.text
        counterItem.count = Int64(countLabel.text!)!
//        counterItem.stepValue = Int16(stepper.stepValue)
        
        
        appDelegate.saveContext()
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func stepperChanged(_ sender: UIStepper) {
    let count: Int = Int(sender.value)
        stepper.stepValue = 1
        
        
        if (count == 1000) {
            countLabel.text = "1K"
        } else {
            countLabel.text = String(count)
        }
        
        
        
    }
    
//    switch stepValuePicker.selectedSegmentIndex {
//           case 0:
//    stepper.stepValue = 1
//    default:
//                break;
//            }
//        }

//        switch stepValuePicker.selectedSegmentIndex {
//        case 0:
//            stepper.stepValue = 1
//            //        case 1:
//            //            stepper.stepValue = 10
//            //        case 2:
//        //            stepper.stepValue = 100
//        default:
//            break;
//        }
//    }

    // MARK: Text Field Stuff
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension UITextField {
    func textFieldPreferences() {
        self.layer.masksToBounds = true
        
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0).cgColor
        self.layer.borderWidth = 1
        
        // padding
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 15.0))
        self.rightView = leftView
        self.leftView = leftView
        self.leftViewMode = .always
        self.rightViewMode = .always
        
        
    }
}
