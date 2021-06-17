//
//  DataBaseEntity.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import UIKit
import CoreData

class DomainBaseEntity: Mappable {
    var objectID: NSManagedObjectID?

    required init() {
    }
}
