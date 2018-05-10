//
//  UserModel.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 20/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import Foundation

struct UserModel: Decodable {
    let platformName: String
    let epicUserHandle: String
    let lifeTimeStats: [ LifeTimeStats ]
    
}

struct LifeTimeStats: Decodable {
    
    let key: String
    let value: String
    
}
