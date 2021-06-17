//
//  CoreDataStorageContext.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import UIKit
import CoreData

class CoreDataStorageContext: StorageContext {

    var managedContext: NSManagedObjectContext?

    required init(configuration: ConfigurationType = .basic(identifier: "SimpleSocialNetwork")) {
        switch configuration {
        case .basic:
            initDB(modelName: configuration.identifier(), storeType: .sqLiteStoreType)
        case .inMemory:
            initDB(storeType: .inMemoryStoreType)
        }
    }

    private func initDB(modelName: String? = nil, storeType: StoreType) {
        let coordinator = CoreDataStoreCoordinator.persistentStoreCoordinator(modelName: modelName, storeType: storeType)
        self.managedContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        self.managedContext?.persistentStoreCoordinator = coordinator
    }
}
