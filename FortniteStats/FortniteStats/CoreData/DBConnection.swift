//
//  DBConnection.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 04/05/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import CoreData
import UIKit

class DBConnection {
    
    enum Entities {
        
        case User
        
        func toString() -> String {
            switch self {
            case .User:
                return "ManagedUsers"
            }
        }
        
    }
    
    // MARK: - Properties
    private let appDelagate: AppDelegate
    private let context: NSManagedObjectContext
    
    init() {
        appDelagate = UIApplication.shared.delegate as! AppDelegate
        context = appDelagate.persistentContainer.viewContext
    }
    
    // MARK: - Generic CRUD
    
    /**
     Create a record in core data, return nil if there are erros.
     - parameters:
        - forEntity: Entities is an enum
        - parameters: [String: Any]?
     - returns: NSManagedObject?
     */
    internal func createRecord(forEntity e: Entities, parameters: [String: Any]? = nil) -> NSManagedObject? {
        guard let entity = NSEntityDescription.entity(forEntityName: e.toString(), in: context) else {
            fatalError("ERROR: Core data has a problem")
        }
        
        let record = NSManagedObject(entity: entity, insertInto: context)
        
        if let params = parameters as NSDictionary? {
            for (key, value) in params {
                record.setValue(value, forKey: key as! String)
            }
        }
        
        do {
            try context.save()
            return record
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return nil
        }
    }
    
}
