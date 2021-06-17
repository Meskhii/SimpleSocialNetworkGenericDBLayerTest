//
//  PostsEntity.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import Foundation
import CoreData

public class PostEntity: NSManagedObject {

}

extension PostEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PostEntity> {
        return NSFetchRequest<PostEntity>(entityName: "PostEntity")
    }

    @NSManaged public var postUUID: UUID?
    @NSManaged public var title: String?
    @NSManaged public var postDescription: String?
    @NSManaged public var image: Data?

}
