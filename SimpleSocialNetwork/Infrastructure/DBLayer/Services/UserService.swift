//
//  UsersService.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import Foundation

import Foundation

class UserService {

 func createUser(user: User) {
  do {
       try DBManager.shared.userDao.save(object: user)
     } catch {
        print(error)
     }
 }
 
    func fetchUserByUsername(username: String, password: String) -> User? {
  
    return DBManager.shared.userDao.findByUsername(username: username, password: password)
      
 }

}
