//
//  HomeTableViewController.swift
//  MyTask
//
//  Created by Johnny Do Amaral Ribeiro on 04/07/19.
//  Copyright © 2019 Johnny Do Amaral Ribeiro. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "taskCell")
        
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        let alert = UIAlertController(title: "Save task", message: "Do you want to save the task?", preferredStyle: .alert)
        let dismissAlert = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        let confirmSave = UIAlertAction(title: "Save", style: .destructive, handler: {
            (alert: UIAlertAction!) in self.saveToFavorites(task: task)})
        alert.addAction(dismissAlert)
        alert.addAction(confirmSave)
        present(alert, animated: true, completion: nil)
    }
    
    func saveToFavorites(task: Task) -> () {
        UserDefaults.standard.set(task.name, forKey: "taskName")
        UserDefaults.standard.set(task.description, forKey: "taskDescription")
    }
}
