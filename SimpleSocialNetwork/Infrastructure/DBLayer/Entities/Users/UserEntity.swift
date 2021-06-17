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

    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var userPosts: NSSet?

}

// MARK: Generated accessors for userPosts
extension UserEntity {

    @objc(addUserPostsObject:)
    @NSManaged public func addToUserPosts(_ value: UserPostsEntity)

    @objc(removeUserPostsObject:)
    @NSManaged public func removeFromUserPosts(_ value: UserPostsEntity)

    @objc(addUserPosts:)
    @NSManaged public func addToUserPosts(_ values: NSSet)

    @objc(removeUserPosts:)
    @NSManaged public func removeFromUserPosts(_ values: NSSet)

}

extension UserEntity : Identifiable {

}
