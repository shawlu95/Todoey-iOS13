//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()

    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item1 = Item(title: "Find Mike")
        let item2 = Item(title: "Buy Eggos")
        let item3 = Item(title: "Destroy Demogorgon")
        itemArray.append(item1)
        itemArray.append(item2)
        itemArray.append(item3)
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        if itemArray[indexPath.row].done {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if itemArray[indexPath.row].done {
            itemArray[indexPath.row].done = false
        } else {
            itemArray[indexPath.row].done = true
        }
        
        tableView.reloadData() // update checkmark
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let new = Item(title: textField.text!)
            self.itemArray.append(new)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField // extend the scope of the alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
