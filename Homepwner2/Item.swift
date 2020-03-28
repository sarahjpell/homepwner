//
//  Item.swift
//  Homepwner2
//
//  Created by Sarah Pell on 3/26/20.
//  Copyright © 2020 Sarah Pell. All rights reserved.
//
import UIKit

class Item: NSObject {
    var title: String
    var adoptionFee: Int
    var serialNumber: String?
    let dateCreated: Date
    
    init(title: String, serialNumber: String?, adoptionFee: Int) {
        self.title = title
        self.adoptionFee = adoptionFee
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        super.init()
        
    }
    //creates random item
    convenience init(random: Bool = false) {
        if random {
            let hairType = ["Long Hair", "Short Hair", "Medium Hair"]
            let pets = ["Kitten", "Cat", "Puppy", "Dog"]
            var idx = arc4random_uniform(UInt32(hairType.count))
            let randHairType = hairType[Int(idx)]
            idx = arc4random_uniform(UInt32(pets.count))
            let randPet = pets[Int(idx)]
            let randTitle = "\(randHairType) \(randPet)"
            let randAdoptFee = Int(arc4random_uniform(100))
//            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            let randomSerialNumber = "number"
            self.init(title: randTitle,
            serialNumber: randomSerialNumber,
            adoptionFee: randAdoptFee)
            
        }
        else {
            self.init(title: "", serialNumber: nil, adoptionFee: 0)
            
        }
        
    }
    
}
