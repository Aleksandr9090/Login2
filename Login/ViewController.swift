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
    
    let user = User.getUserData()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                guard let userInfoVC = navigationVC.topViewController as? UserInfoViewController else { return }
                userInfoVC.user = user
            }
        }
    }
    
    @IBAction func logInButtonPressed() {
        guard userNameTextField.text == user.login, passwordTextField.text == user.password else {
           showLogInAlert(
            title: "Invalid name or password",
            message: "Please, enter your name and password"
           )
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showForgotAlert(title: "Did you forget user name?", message: "User name: \(user.login).")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showForgotAlert(title: "Did you forget password?", message: "Password: \(user.password).")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let welcomeVC = segue.source as? WelcomeViewController else { return }
        userNameTextField.text = welcomeVC.user.login
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


