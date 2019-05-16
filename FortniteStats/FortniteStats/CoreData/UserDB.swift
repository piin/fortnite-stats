//
//  UserDB.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 04/05/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import Foundation
import CoreData

enum UserProperties: String {
    case epicUserHandle
    case kd
    case kills
    case matchesPlayed
    case platformName
    case score
    case top3
    case top3s
    case top5s
    case top6s
    case top12s
    case top25s
    case winPercent
    case wins 
}

class UserDB: DBConnection {
    
    // MARK: - CRUD
    
    /**
     Call createRecord in order to create a user in DB
     - parameters:
        - userModel: UserModel
     - returns: NSManagedObject?
     */
    func createUser(userModel: UserModel) -> NSManagedObject? {
        var params: [String: Any] = [:]
        params[UserProperties.epicUserHandle.rawValue] = userModel.epicUserHandle
        params[UserProperties.platformName.rawValue] = userModel.platformName
        
        if userModel.lifeTimeStats.count == 12 {
            params[UserProperties.top3.rawValue] = userModel.lifeTimeStats[0].value
            params[UserProperties.top5s.rawValue] = userModel.lifeTimeStats[1].value
            params[UserProperties.top3s.rawValue] = userModel.lifeTimeStats[2].value
            params[UserProperties.top6s.rawValue] = userModel.lifeTimeStats[3].value
            params[UserProperties.top12s.rawValue] = userModel.lifeTimeStats[4].value
            params[UserProperties.top25s.rawValue] = userModel.lifeTimeStats[5].value
            params[UserProperties.score.rawValue] = userModel.lifeTimeStats[6].value
            params[UserProperties.matchesPlayed.rawValue] = userModel.lifeTimeStats[7].value
            params[UserProperties.wins.rawValue] = userModel.lifeTimeStats[8].value
            params[UserProperties.winPercent.rawValue] = userModel.lifeTimeStats[9].value
            params[UserProperties.kills.rawValue] = userModel.lifeTimeStats[10].value
            params[UserProperties.kd.rawValue] = userModel.lifeTimeStats[11].value
        }

        return createRecord(forEntity: .User, parameters: params)

    }
    
}
