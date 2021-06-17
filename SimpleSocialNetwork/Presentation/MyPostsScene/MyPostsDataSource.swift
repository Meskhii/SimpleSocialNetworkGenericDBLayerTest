//
//  MyPostsDataSource.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import UIKit

class MyPostsDataSource: NSObject {
    
    // MARK: - Variables
    private var tableView: UITableView!
    private var navController: UINavigationController?
    private var delegate: EditPostTableViewControllerDelegate?
    
    private var userPostService = UserPostsService()
    private var userPosts = [UserPosts]()
    
    private var postService = PostService()
    private var posts = [Post]()
    
    // MARK: - Inits
    init(with tableView: UITableView, delegate: EditPostTableViewControllerDelegate, navController: UINavigationController) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.delegate = delegate
        self.navController = navController
        
        fetchPostUUIDsForUser()
    }
    
    private func fetchPostUUIDsForUser() {
        userPosts = userPostService.fetchPostUUIDsForUser()
        for post in userPosts {
            print("User \(post.postUUID)")
        }
        
    }
    
    private func fetchPostsForUser() {
       posts = postService.fetchPosts()
    }
    
}

// MARK: - UITableView Data Source
extension MyPostsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(MyPostCell.self, for: indexPath)
        
   //     cell.setNote(using: NotesList.shared.notes[indexPath.row])
        
        return cell
    }
}

// MARK: - UITableView Delegate
extension MyPostsDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    //    NotesList.shared.notes.remove(at: indexPath.row)
        
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
    
//        let storyboard = UIStoryboard(name: VCIds.addPostTVC, bundle: nil)
//        guard let postInteractorVC = storyboard.instantiateViewController(identifier: VCIds.addPostTVC) as? AddPostTableViewController else {return}
//        postInteractorVC.delegate = delegate
//        postInteractorVC.navTitle = "Edit Item"
    
       // self.navController?.pushViewController(postInteractorVC, animated: true)
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
//        NotesList.shared.moveNote(item: NotesList.shared.notes[sourceIndexPath.row], to: destinationIndexPath.row)
        
        tableView.reloadData()
    }

}

