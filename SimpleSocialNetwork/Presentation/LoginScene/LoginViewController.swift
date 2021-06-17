//
//  LoginViewController.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Variables
    private var userService = UserService()

    // MARK: - IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginUser(_ sender: Any) {
        if checkInputs() {
            if validateUser() {
                navigateTo(vcId: VCIds.postsVC)
            } else {
                showAlert(with: "Username Or Password Incorrect.")
            }
        } else {
            showAlert(with: "Fill All Fields")
        }
    }
    
    private func validateUser() -> Bool {
        let user = userService.fetchUserByUsername(username: usernameTextField.text!, password: passwordTextField.text!)
        if user != nil {
            return true
        }
        return false
    }
    
    // MARK: - Helper Methods
    private func checkInputs() -> Bool {
        return usernameTextField.hasText || passwordTextField.hasText
    }
    
    
    private func navigateTo(vcId: String) {
        let sb = UIStoryboard(name: vcId, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: vcId)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Helper Methods
    private func showAlert(with errorMessage: String) {
        
        let alert = UIAlertController(title: "Error",
                                      message: errorMessage,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
}
