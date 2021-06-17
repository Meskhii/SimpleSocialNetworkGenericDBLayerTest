//
//  PostsDao.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import UIKit

class PostDao: BaseDao<Post, PostEntity> {

    func findById(postNumber: String) -> Post? {
        return super.fetch(predicate: NSPredicate(format: "postNumber = %"+postNumber)).last
    }
}
