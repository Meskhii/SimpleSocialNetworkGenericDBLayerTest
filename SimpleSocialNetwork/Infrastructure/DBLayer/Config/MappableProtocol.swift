//
//  MappableProtocol.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import Foundation
import CoreData

protocol Mappable {
    var objectID: NSManagedObjectID? { get set }
    init()
}
