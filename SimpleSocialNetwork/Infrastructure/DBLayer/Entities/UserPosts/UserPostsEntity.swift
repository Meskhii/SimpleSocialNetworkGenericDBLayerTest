//
//  UserPostsEntity.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import Foundation
import CoreData

public class UserPostsEntity: NSManagedObject {

}

extension UserPostsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserPostsEntity> {
        return NSFetchRequest<UserPostsEntity>(entityName: "UserPostsEntity")
    }

    @NSManaged public var postUUID: UUID?
    @NSManaged public var user: UserEntity?

}

extension UserPostsEntity : Identifiable {

}
