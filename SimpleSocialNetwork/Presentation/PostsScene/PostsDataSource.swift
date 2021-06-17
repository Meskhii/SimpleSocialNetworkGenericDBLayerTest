//
//  PostsDataSource.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import UIKit

class PostsDataSource: NSObject {
    
    // MARK: - Variables
    private var tableView: UITableView!
    private var navController: UINavigationController?
    private var delegate: AddPostTableViewControllerDelegate?
    
    private var postService = PostService()
    private var posts = [Post]()
    
    // MARK: - Inits
    init(with tableView: UITableView, delegate: AddPostTableViewControllerDelegate, navController: UINavigationController) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.delegate = delegate
        self.navController = navController
        
        fetchPosts()
    }
    
    private func fetchPosts() {
       posts = postService.fetchPosts()
    }
    
}

// MARK: - UITableView Data Source & Delegate
extension PostsDataSource: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(PostCell.self, for: indexPath)
        
        if !posts.isEmpty {
            cell.configure(with: posts[indexPath.row])
        }
        
        return cell
    }
}
