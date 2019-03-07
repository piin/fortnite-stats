//
//  LifeTimeCell.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 2/4/19.
//  Copyright © 2019 Jair Pinedo. All rights reserved.
//

import UIKit

class LifetimeCell: UITableViewCell {
    
    // MARK: Properties
    static let idetifier = "LifetimeCell"
    
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var winPercentLabel: UILabel!
    @IBOutlet weak var killsLabel: UILabel!
    @IBOutlet weak var kdLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
