//
//  UserDB.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 04/05/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import Foundation
import CoreData

class UserDB: DBConnection {
    
    //MARK: - BD attributes names
    struct properties {
        static let epicUserHandle = "epicUserHandle"
        static let kd = "kd"
        static let kills = "kills"
        static let matchesPlayed = "matchesPlayed"
        static let platformName = "platformName"
        static let score = "score"
        static let top3 = "top3"
        static let top3s = "top3s"
        static let top5s = "top5s"
        static let top6s = "top6s"
        static let top12s = "top12s"
        static let top25s = "top25s"
        static let winPercent = "winPercent"
        static let wins = "wins"
    }
    
    // MARK: - CRUD
    
    /**
     Call createRecord in order to create a user in DB
     - parameters:
        - userModel: UserModel
     - returns: NSManagedObject?
     */
    func createUser(userModel: UserModel) -> NSManagedObject? {
        var params: [String: Any] = [:]
        params[properties.epicUserHandle] = userModel.epicUserHandle
        params[properties.platformName] = userModel.platformName
        
        if userModel.lifeTimeStats.count == 12 {
            params[properties.top3] = userModel.lifeTimeStats[0].value
            params[properties.top5s] = userModel.lifeTimeStats[1].value
            params[properties.top3s] = userModel.lifeTimeStats[2].value
            params[properties.top6s] = userModel.lifeTimeStats[3].value
            params[properties.top12s] = userModel.lifeTimeStats[4].value
            params[properties.top25s] = userModel.lifeTimeStats[5].value
            params[properties.score] = userModel.lifeTimeStats[6].value
            params[properties.matchesPlayed] = userModel.lifeTimeStats[7].value
            params[properties.wins] = userModel.lifeTimeStats[8].value
            params[properties.winPercent] = userModel.lifeTimeStats[9].value
            params[properties.kills] = userModel.lifeTimeStats[10].value
            params[properties.kd] = userModel.lifeTimeStats[11].value
        }

        return createRecord(forEntity: .User, parameters: params)

    }
    
}
