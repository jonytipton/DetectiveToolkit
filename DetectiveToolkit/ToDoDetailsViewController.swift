//
//  ToDoDetailsViewController.swift
//  ToDoList
//
//  Created by Jonathan Tipton on 3/10/20.
//  Copyright © 2020 Jonathan Tipton. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class ToDoDetailsViewController: UIViewController {

    //var toDo = ToDo()
    var toDoCD:ToDoCD? = nil
    
    @IBOutlet weak var toDoLabel: UILabel!
    @IBAction func doneTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDo = toDoCD {
                context.delete(toDo)
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDo = toDoCD {
            if toDo.priority == 1 {
                if let name = toDo.name {
                    toDoLabel.text = " ! " + name
                }
            }
            else if toDo.priority == 2 {
                if let name = toDo.name {
                    toDoLabel.text = " !! " + name
                }
            }
            else {
                if let name = toDo.name {
                    toDoLabel.text = name
                }
            }
        }
        /*
        if toDo.priority == 1 {
            toDoLabel.text = " ! " + toDo.name
        }
        else if toDo.priority == 2 {
            toDoLabel.text = " !! " + toDo.name
        }
        else {
            toDoLabel.text = toDo.name
        }
        */
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
