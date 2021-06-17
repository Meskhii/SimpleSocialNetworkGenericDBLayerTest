//
//  UsersEntity.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import Foundation
import CoreData

public class UserEntity: NSManagedObject {

}

extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?
}
