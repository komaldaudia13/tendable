//
//  AuthViewModel.swift
//  mobileAppTest
//
//  Created by Komal Daudia on 23/07/24.
//

import Foundation

import Foundation

class AuthViewModel {
    var email: String = ""
    var password: String = ""
    
    var loginSuccess: (() -> Void)?
    var registrationSuccess: (() -> Void)?
    var showError: ((String) -> Void)?
    
    func register() {
        AuthService.shared.register(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.registrationSuccess?()
                case .failure(let error):
                    self?.showError?(error.localizedDescription)
                }
            }
        }
    }
    
    func login() {
        AuthService.shared.login(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.loginSuccess?()
                case .failure(let error):
                    self?.showError?(error.localizedDescription)
                }
            }
        }
    }
}

