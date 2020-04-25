//
//  ItemStore.swift
//  Homepwner2
//
//  Created by Sarah Pell on 3/26/20.
//  Copyright © 2020 Sarah Pell. All rights reserved.
//
import CoreData
import UIKit
class ItemStore {
    
    var allItems = [Item]()
//    var item = Item()
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error setting up Core Data \(error)).")
            }
        }
        
        return container
    }()
    let itemArchiveURL: URL = {
        let documentsDirectories =
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
        
    }()
    
    init() {
        if let archivedItems =
            NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [Item] {
            allItems = archivedItems
        }
    }
    
    func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
    }
    
    //create and return new item
//    @discardableResult func createItem(into context: NSManagedObjectContext) -> Item {
//
//        let newItem = NSEntityDescription.insertNewObjectForEntityForName("newItem", inManagedObjectContext: NSManagedObject)
//let newItem = Item(context: context)
    @discardableResult func createItem() -> Item{
        let newItem = Item()
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
