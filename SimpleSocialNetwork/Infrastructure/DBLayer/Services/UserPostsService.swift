//
//  UserPostsService.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import Foundation

class UserPostsService {

 func save(userPost: UserPosts) {
    
    do {
        try DBManager.shared.userPostsDao.save(object: userPost)
        } catch {
            print(error)
        }
    }
 
    func fetchPostsForUser() -> [UserPosts] {
  
        return DBManager.shared.userPostsDao.allPostsForUser()
      
    }

}
