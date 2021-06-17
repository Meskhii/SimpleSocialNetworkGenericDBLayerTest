//
//  PostsDao.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import UIKit

class PostDao: BaseDao<Post, PostEntity> {

    func allPosts() -> [Post] {
        return super.fetchAll()
    }
}
