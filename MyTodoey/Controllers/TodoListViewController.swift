//
//  ViewController.swift
//  MyTodoey
//
//  Created by Nikola Popovic on 2/18/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let keyToDoListItems = "TodoListArray"
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let items = defaults.array(forKey: keyToDoListItems) as? [Item] {
//            itemArray = items
//        }
        fillArray()
    }
    
    func fillArray (){
        let item1 = Item(title: "Milk")
        let item2 = Item(title: "Bred")
        let item3 = Item(title: "Apple")
        itemArray.append(item1)
        itemArray.append(item2)
        itemArray.append(item3)
    }

    //MARK - Table View Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.accessoryType = item.done ? .checkmark : .none
        cell.textLabel?.text = item.title
        return cell
    }
    
    
    // MARK - Table View Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = itemArray[indexPath.row]
        item.done = !item.done
        
        tableView.reloadRows(at: [indexPath], with: .fade)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK - Add New Item
    
    @IBAction func addButtonPressed(_ sender: Any) {
        createPopUp()
    }
    
    func createPopUp (){
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            
            let newItem = Item(title: textField.text!)
            self.itemArray.append(newItem)
            //self.defaults.set(self.itemArray, forKey: self.keyToDoListItems)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Itme"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}

