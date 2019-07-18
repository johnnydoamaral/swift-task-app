//
//  ViewController.swift
//  MyTask
//
//  Created by Johnny Do Amaral Ribeiro on 24/06/19.
//  Copyright © 2019 Johnny Do Amaral Ribeiro. All rights reserved.
//

import UIKit

var tasks = [Task]()

class ViewController: UIViewController {

    @IBOutlet var taskName: UITextField!
    @IBOutlet var taskDescription: UITextView!
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBAction func saveButton(_ sender: Any) {
        let taskDate = datePicker.date
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .full
        dateFormat.timeStyle = .short
        let taskDateString = dateFormat.string(from: taskDate)
        
        if let name = taskName.text, let desc = taskDescription.text {
            let task = Task(name: name, description: desc, date: taskDateString)
            tasks.append(task)
        }
        let taskSavedAlert = UIAlertController(title: "Success", message: "Your task has been saved.", preferredStyle: .alert)
        let dismissAlert = UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in self.clearFields()})
        taskSavedAlert.addAction(dismissAlert)
        present(taskSavedAlert, animated: true, completion: nil)
    }
    
    @IBAction func dismissTaskScreen(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    fileprivate func clearFields() {
        taskName.text = ""
        taskDescription.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        self.taskDescription.layer.borderColor = UIColor.lightGray.cgColor
        self.taskDescription.layer.borderWidth = 0.3
    }
    
}
