//
//  LoginViewController.swift
//  mobileAppTest
//
//  Created by Komal Daudia on 23/07/24.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let viewModel = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loginSuccess = { [weak self] in
            self?.performSegue(withIdentifier: "showInspections", sender: nil)
        }

        viewModel.registrationSuccess = { [weak self] in
            self?.showAlert(message: "Registration successful! Please login.")
        }
        
        viewModel.showError = { [weak self] message in
            self?.showAlert(message: message)
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        viewModel.email = emailTextField.text ?? ""
        viewModel.password = passwordTextField.text ?? ""
        viewModel.login()
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        viewModel.email = emailTextField.text ?? ""
        viewModel.password = passwordTextField.text ?? ""
        viewModel.register()
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


