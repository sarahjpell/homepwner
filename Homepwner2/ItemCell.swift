//
//  ItemCell.swift
//  Homepwner2
//
//  Created by Sarah Pell on 3/28/20.
//  Copyright © 2020 Sarah Pell. All rights reserved.
//

import UIKit
class ItemCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    func updateValueLabelTextColor() {
        if let text = valueLabel.text {
            let startIndex = text.index(text.startIndex, offsetBy: 1)
            if let value = Double(text.substring(from: startIndex)) {

                if value < 50 {
                    valueLabel.textColor = UIColor.green
                } else {
                    valueLabel.textColor = UIColor.red
                }
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateValueLabelTextColor()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }
    
}
