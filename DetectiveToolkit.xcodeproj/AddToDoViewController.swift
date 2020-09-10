//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Jonathan Tipton on 3/10/20.
//  Copyright © 2020 Jonathan Tipton. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController,
                             UIImagePickerControllerDelegate,
                             UINavigationControllerDelegate
{
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var toDoTableViewController: ToDoTableViewController? = nil
    var pickerController = UIImagePickerController()
    
    @IBAction func mediaFolderTapped(_ sender: Any) {
        pickerController.sourceType = .photoLibrary
        present(pickerController,animated:true,completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        pickerController.sourceType = .camera
        present(pickerController,animated:true,completion: nil)
    }
    
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newToDo = ToDoCD(context:context)
            newToDo.priority = Int32(prioritySegment.selectedSegmentIndex)
            
            if let name = nameTextField.text {
                newToDo.name = name
            }
            newToDo.image = imageView.image?.jpegData(compressionQuality: 1.0)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        pickerController.dismiss(animated: true, completion: nil)
    }
}
