//
//  FavoritesController.swift
//  MyTask
//
//  Created by Johnny Do Amaral Ribeiro on 15/07/19.
//  Copyright © 2019 Johnny Do Amaral Ribeiro. All rights reserved.
//

import UIKit

class FavoritesController: UIViewController {
    
    @IBOutlet var favoriteTaskLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        let taskName = UserDefaults.standard.string(forKey: "taskName")
        let taskDescription = UserDefaults.standard.string(forKey: "taskDescription")
        if let name = taskName, let description = taskDescription {
            favoriteTaskLabel.text = "Task: \(name). Description: \(description)."
        }
        else {
            favoriteTaskLabel.text = "No value saved yet."
        }
        allowLabelLineBreakAccordingToTextSize()
    }
    
    fileprivate func allowLabelLineBreakAccordingToTextSize() {
        favoriteTaskLabel.lineBreakMode = .byWordWrapping
        favoriteTaskLabel.numberOfLines = 0
    }

}
