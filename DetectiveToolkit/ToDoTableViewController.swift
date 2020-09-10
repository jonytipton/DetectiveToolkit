//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Jonathan Tipton on 2/5/20.
//  Copyright © 2020 Jonathan Tipton. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    //declares and initializes an empty array that will contain ToDo objects
    //var toDos: [ToDo] = []
    var toDoCDs:[ToDoCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let toDo1 = ToDo()
        toDo1.name = "Write chapter one of iOS 13 book"
        toDo1.priority = 0
        let toDo2 = ToDo()
        toDo2.name = "Edit iOS 13 book"
        toDo2.priority = 1
        
        toDos = [toDo1, toDo2]
        */
        //fills up the array
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func getToDos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDosFromCoreData = try? context.fetch(ToDoCD.fetchRequest()) {
                if let toDos = toDosFromCoreData as? [ToDoCD] {
                    toDoCDs = toDos
                    tableView.reloadData()
                }
            }
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return toDos.count
        return toDoCDs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //let selectedToDo = toDos[indexPath.row]
        let selectedToDo = toDoCDs[indexPath.row]
        /*
        if selectedToDo.priority == 1{
            cell.textLabel?.text = "! " + selectedToDo.name
        }
        else if selectedToDo.priority == 2 {
            cell.textLabel?.text = "!!" + selectedToDo.name
        }
        else {
            cell.textLabel?.text = selectedToDo.name
        }*/
        if selectedToDo.priority == 1 {
            if let name = selectedToDo.name {
                cell.textLabel?.text = " ! " + name
            }
        }
        else if selectedToDo.priority == 2 {
            if let name = selectedToDo.name {
                cell.textLabel?.text = " !! " + name
            }
        }
        else {
            if let name = selectedToDo.name {
                cell.textLabel?.text = name
            }
        }
        if let data = selectedToDo.image {
            cell.imageView?.image = UIImage(data:data)
        }
        // Configure the cell...
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                let selectedToDo = toDoCDs[indexPath.row]
                context.delete(selectedToDo)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                getToDos()
            }
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let addToDoViewController = segue.destination as? AddToDoViewController {
            addToDoViewController.toDoTableViewController = self
        }
        
        if let detailsToDoViewController = segue.destination as? ToDoDetailsViewController{
            if let selectedToDo = sender as? ToDoCD{
                detailsToDoViewController.toDoCD = selectedToDo
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let selectedToDo = toDos[indexPath.row]
        let selectedToDo = toDoCDs[indexPath.row]
        performSegue(withIdentifier: "moveToDetails", sender: selectedToDo)
    }
    

}
