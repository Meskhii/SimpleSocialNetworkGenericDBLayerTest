//
//  StorageContext+Extenstion.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import Foundation
import CoreData

extension StorageContext {

    func objectWithObjectId<DBEntity: Storable>(objectId: NSManagedObjectID) -> DBEntity? {
        return nil
    }
}
