//
//  ItemStore.swift
//  Homepwner2
//
//  Created by Sarah Pell on 3/26/20.
//  Copyright © 2020 Sarah Pell. All rights reserved.
//

import UIKit
class ItemStore {
    
    var allItems = [Item]()
    
    //create and return new item
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
        allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
        return
        }
        // Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        // Remove item from array
        allItems.remove(at: fromIndex)
        // Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
    
    
}
