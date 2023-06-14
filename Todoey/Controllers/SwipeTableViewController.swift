//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by main on 6/14/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        return cell
    }
    
    // MARK: - Swipe cell delegate methods
    
    func tableView(_ tableView: UITableView,
                   editActionsForRowAt indexPath: IndexPath,
                   for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil } // swipe from right
        
        let action = SwipeAction(style: .destructive,
                                 title: "Delete") { (action, indexPath) in
            self.updateModel(at: indexPath)
        }
        action.image = UIImage(named: "delete-icon")
        return [action]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .drag
        return options
    }

    // MARK: - Must Override
    func updateModel(at indexPath: IndexPath) {
        // update data model
    }
}
