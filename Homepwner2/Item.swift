//
//  Item.swift
//  Homepwner2
//
//  Created by Sarah Pell on 3/26/20.
//  Copyright © 2020 Sarah Pell. All rights reserved.
//
import UIKit

class Item: NSObject, NSCoding {
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(dateCreated, forKey: "dateCreated")
        aCoder.encode(itemKey, forKey: "itemKey")
        aCoder.encode(desc, forKey: "desc")
        aCoder.encode(adoptionFee, forKey: "adoptionFee")
    }
    
    required init(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObject(forKey: "title") as! String
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        itemKey = aDecoder.decodeObject(forKey: "itemKey") as! String
        desc = aDecoder.decodeObject(forKey: "desc") as! String?
        adoptionFee = aDecoder.decodeInteger(forKey: "adoptionFee")
        super.init()
    }
    
    var title: String
    var adoptionFee: Int
    var desc: String?
    let dateCreated: Date
    let itemKey: String
    
    init(title: String, desc: String?, adoptionFee: Int) {
        self.title = title
        self.adoptionFee = adoptionFee
        self.desc = desc
        self.dateCreated = Date()
        self.itemKey = UUID().uuidString
        super.init()
        
    }
    //creates random item
    convenience init(random: Bool = false) {
        if random {
//            let hairType = ["Long Hair", "Short Hair", "Medium Hair"]
//            let pets = ["Kitten", "Cat", "Puppy", "Dog"]
//            var idx = arc4random_uniform(UInt32(hairType.count))
//            let randHairType = hairType[Int(idx)]
//            idx = arc4random_uniform(UInt32(pets.count))
//            let randPet = pets[Int(idx)]
            let randTitle = "Name"
            let randAdoptFee = 0
//            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            let desc = "Description"
            self.init(title: randTitle,
            desc: desc,
            adoptionFee: randAdoptFee)
            
        }
        else {
            self.init(title: "", desc: "", adoptionFee: 0)
            
        }
        
    }
    
}
