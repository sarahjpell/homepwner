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
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
}
