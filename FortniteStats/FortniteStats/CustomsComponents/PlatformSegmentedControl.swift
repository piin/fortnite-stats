//
//  PlatformSegmentedControl.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 03/05/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import UIKit

class PlatformSegmentedControl: UISegmentedControl {

    enum Platforms: String {
        case pc
        case psn
        case xbl
        
        func getString() -> String { return self.rawValue }
    }
    
    /**
     selected value, posible options: pc, psn & xbl. Default value pc
     */
    var selectedValue: Platforms {
        
        switch selectedSegmentIndex {
        case 0: return .pc
        case 1: return .psn
        case 2: return .xbl
        default :
            return .pc
        }
        
    }

}
