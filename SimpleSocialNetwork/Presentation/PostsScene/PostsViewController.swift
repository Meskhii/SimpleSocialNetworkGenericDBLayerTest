//
//  PostsViewController.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import UIKit

class PostsViewController: UIViewController {
    
    // MARK: - Variables
    private var dataSource: PostsDataSource!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false

        tableView.registerNib(class: PostCell.self)
        configureDataSource()
    }
    
    @IBAction func openMyPosts(_ sender: Any) {
        let storyboard = UIStoryboard(name: VCIds.myPostsVC, bundle: nil)
        let myPostsVC = storyboard.instantiateViewController(identifier: VCIds.myPostsVC)
        
        navigationController?.pushViewController(myPostsVC, animated: true)
    }
    
    @IBAction func openAddPost(_ sender: Any) {
        let storyboard = UIStoryboard(name: VCIds.addPostTVC, bundle: nil)
        guard let addPostTVC = storyboard.instantiateViewController(identifier: VCIds.addPostTVC) as? AddPostTableViewController else {return}
        
        addPostTVC.delegate = self
        addPostTVC.navTitle = "Add Item"
        
        navigationController?.pushViewController(addPostTVC, animated: true)
    }
    
    // MARK: - Configure Data Source
    private func configureDataSource() {
        dataSource = PostsDataSource(with: tableView, delegate: self, navController: navigationController!)
    }
    
}

// MARK: - Edit note table view controller delegate
extension PostsViewController: AddPostTableViewControllerDelegate {
    
    func postInteractionDidCancel(_ controller: AddPostTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func postInteractionDidSave(_ controller: AddPostTableViewController) {
        
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    func postInteractionDoneEditing(_ controller: AddPostTableViewController, didFinishEditing item: String) {
        
//        if let index = NotesList.shared.notes.firstIndex(of: item) {
//            let indexPath = IndexPath(row: index, section: 0)
//            if let cell = tableView.cellForRow(at: indexPath) {
//                configureNoteText(for: cell, with: item)
//            }
//        }
//        navigationController?.popViewController(animated: true)
        
    }
    
}

