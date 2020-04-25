//
//  Item+CoreDataProperties.swift
//  Homepwner2
//
//  Created by Sarah Pell on 4/18/20.
//  Copyright © 2020 Sarah Pell. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
//        return NSFetchRequest<Item>(entityName: "Item")
//    }

    @NSManaged public var title: String
    @NSManaged public var dateCreated: Date
    @NSManaged public var desc: String
    @NSManaged public var itemKey: String
    @NSManaged public var adoptionFee: Int64
   
}
