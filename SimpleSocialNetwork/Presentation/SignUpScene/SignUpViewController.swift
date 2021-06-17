//
//  SignUpViewController.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Variables
    private var userService = UserService()
    private var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
                print(paths[0])
        
    }

    @IBAction func signUpUser(_ sender: Any) {
        if checkInputs() {
            createUser()
            userService.createUser(user: user)
            navigateToPosts()
        } else {
            showAlert()
        }
    }
    
    private func createUser() {
        user = User()
        user.username = usernameTextField.text!
        user.password = passwordTextField.text!
    }
    
    // MARK: - Helper Methods
    private func checkInputs() -> Bool {
        return usernameTextField.hasText || passwordTextField.hasText
    }
    
    private func showAlert() {
        
        let alert = UIAlertController(title: "Error",
                                      message: "Feel All Fields",
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    // MARK: - Navigation Method
    private func navigateToPosts() {
        let sb = UIStoryboard(name: VCIds.postsVC, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: VCIds.postsVC)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
