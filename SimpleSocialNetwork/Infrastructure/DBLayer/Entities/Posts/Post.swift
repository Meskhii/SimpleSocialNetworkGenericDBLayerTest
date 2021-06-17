//
//  Posts.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import Foundation

class Post: DomainBaseEntity, Codable {
    var postUUID: UUID?
    var title: String?
    var postDescription: String?
    var image: Data?
}
