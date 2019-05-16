//
//  Entities.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 5/14/19.
//  Copyright © 2019 Jair Pinedo. All rights reserved.
//

import Foundation

enum Entities {
    
    case User
    
    func toString() -> String {
        switch self {
        case .User:
            return "ManagedUsers"
            
        }
    }
    
}
