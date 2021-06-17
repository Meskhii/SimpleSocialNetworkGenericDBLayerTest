//
//  PostsService.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import Foundation

class PostService {

 func createPost(post: Post) {
  do {
       try DBManager.shared.postDao.save(object: post)
     } catch {
     }
 }
 
 func fetchStoryByPostNumber(postNumber: String) -> Post? {
  
    return DBManager.shared.postDao.findById(postNumber: postNumber)
      
 }

}
