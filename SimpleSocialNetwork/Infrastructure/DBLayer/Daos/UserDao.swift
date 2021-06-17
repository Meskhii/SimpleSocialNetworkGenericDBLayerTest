//
//  UsersDao.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import UIKit

class UserDao: BaseDao<User, UserEntity> {

    func findByUsername(username: String, password: String) -> User? {
        return super.fetch(predicate: NSPredicate(format: "(username = %@) AND (password = %@)", username, password)).first
    }
}

