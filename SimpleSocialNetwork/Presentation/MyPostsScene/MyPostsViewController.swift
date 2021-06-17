//
//  MyPostsViewController.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import UIKit

class MyPostsViewController: UIViewController {

    // MARK: - Variables
    private var dataSource: MyPostsDataSource!
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerNib(class: MyPostCell.self)
        configureDataSource()
    }
    
    // MARK: - Configure Data Source
    private func configureDataSource() {
        dataSource = MyPostsDataSource(with: tableView, delegate: self, navController: navigationController!)
    }
}

// MARK: - Edit note table view controller delegate
extension MyPostsViewController: EditPostTableViewControllerDelegate {
    func postInteractionDidCancel(_ controller: EditPostTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func postInteractionDoneEditing(_ controller: EditPostTableViewController, didFinishEditing item: String) {
        
        //        if let index = NotesList.shared.notes.firstIndex(of: item) {
        //            let indexPath = IndexPath(row: index, section: 0)
        //            if let cell = tableView.cellForRow(at: indexPath) {
        //                configureNoteText(for: cell, with: item)
        //            }
        //        }
        //        navigationController?.popViewController(animated: true)
    }
    
}

