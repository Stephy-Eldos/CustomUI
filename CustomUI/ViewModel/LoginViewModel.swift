//
//  LoginViewModel.swift
//  CustomUI
//
//  Created by Eldos Thomas on 29/4/22.
//

import Foundation

class LoginViewModel {
  
    var username: String {
        get {
            return Settings.shared.username
        }
    }
    var password: String {
        get {
            return Settings.shared.password
        }
    }
}
