//
//  PostInteractorTableViewController.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import UIKit

protocol AddPostTableViewControllerDelegate: AnyObject {
    
    func postInteractionDidCancel(_ controller: AddPostTableViewController)
    func postInteractionDidSave(_ controller: AddPostTableViewController)
}

class AddPostTableViewController: UITableViewController {
    
    // MARK: - Variables
    private var saveBarButtonItem = UIBarButtonItem()
    private var postService = PostService()
    private var userPostService = UserPostsService()
    private var post: Post!
    private var userPost: UserPosts!
    
    weak var delegate: AddPostTableViewControllerDelegate?
    var navTitle = String()
    
    // MARK: - IBOutlets
    @IBOutlet weak var postTitleTextField: UITextField!
    @IBOutlet weak var postDescriptionTextField: UITextField!
    @IBOutlet weak var postImageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addButtonsToNavBar()

    }
    
    // MARK: - Button setupers
    func addButtonsToNavBar() {
        let cancelBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelEditing))
        self.navigationItem.leftBarButtonItem  = cancelBarButtonItem
        
        saveBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveItem))
        self.navigationItem.rightBarButtonItem  = saveBarButtonItem
        
        self.navigationItem.title = navTitle
    }
    
    @objc func cancelEditing() {
        delegate?.postInteractionDidCancel(self)
    }
    
    @objc func saveItem() {
        if checkInputs() {
            createPost()
            postService.createPost(post: post)
            userPostService.save(userPost: userPost)
            delegate?.postInteractionDidSave(self)
        } else {
            showAlert(with: "Fill All Fields")
        }
    }
    
    
    
    // MARK: - Navigation Method
    private func navigateToPosts() {
        let sb = UIStoryboard(name: VCIds.postsVC, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: VCIds.postsVC)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createPost() {
        let uuid = UUID()
        
        post = Post()
        post.title = postTitleTextField.text!
        post.postDescription = postDescriptionTextField.text!
        post.postUUID = uuid
        
        userPost = UserPosts()
        userPost.postUUID = uuid
    }
    
    // MARK: - Helper Methods
    private func checkInputs() -> Bool {
        return postTitleTextField.hasText || postImageTextField.hasText || postImageTextField.hasText
    }
    
    private func showAlert(with message: String) {
        
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
