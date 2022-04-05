//
//  CoreDataManager.swift
//  Skate App
//
//  Created by Youssef Bhl on 04/03/2022.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    var successCompletion : ((Bool)->Void)?
    
    private var _appDelegate = UIApplication.shared.delegate as! AppDelegate
    var container: NSPersistentContainer {
        return _appDelegate.persistentContainer
    }
    
    var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    
    
}
