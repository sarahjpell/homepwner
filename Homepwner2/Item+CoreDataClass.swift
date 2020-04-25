//
//  Item+CoreDataClass.swift
//  Homepwner2
//
//  Created by Sarah Pell on 4/18/20.
//  Copyright © 2020 Sarah Pell. All rights reserved.
//
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    override public func awakeFromInsert() {
        super.awakeFromInsert()

        // Give properties initial values
        title = "Name"
        adoptionFee = 0
        dateCreated = Date()
        desc = "Description"
        itemKey = "123ABC"
        
    }

}
