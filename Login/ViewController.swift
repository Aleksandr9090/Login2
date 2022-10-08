//
//  ViewController.swift
//  Login
//
//  Created by Aleksandr on 08.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let userName = "User"
    private let password = "password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userName
    }
    
    @IBAction func logInButtonPressed() {
        guard userNameTextField.text == userName, passwordTextField.text == password else {
           showLogInAlert(
            title: "Invalid name or password",
            message: "Please, enter your name and password"
           )
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showForgotAlert(title: "Did you forget user name?", message: "User name: \(userName).")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showForgotAlert(title: "Did you forget password?", message: "Password: \(password).")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let welcomeVC = segue.source as? WelcomeViewController else { return }
        userNameTextField.text = welcomeVC.userName
        passwordTextField.text = ""
    }
    
}

// MARK: Private Methods
extension ViewController {
    private func showLogInAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func showForgotAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


