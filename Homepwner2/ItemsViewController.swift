//
//  ItemsViewController.swift
//  Homepwner2
//
//  Created by Sarah Pell on 3/26/20.
//  Copyright © 2020 Sarah Pell. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    //pg 202
    var itemStore: ItemStore!

//    override func tableView(_ tableView: UITableView,
//                            numberOfRowsInSection section: Int) -> Int {
////        print(itemStore.allItems.count)
//        return itemStore.allItems.count
//    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",
                                                 for: indexPath)

        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        return cell
    }
}
