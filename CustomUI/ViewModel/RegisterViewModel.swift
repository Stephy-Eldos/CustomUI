//
//  RegisterViewModel.swift
//  CustomUI
//
//  Created by Eldos Thomas on 28/4/22.
//

import Foundation

class RegisterViewModel {
  
    var username: String {
        get {
            return Settings.shared.username
        }
        set {
            Settings.shared.username = newValue
        }
    }
    var password: String {
        get {
            return Settings.shared.password
        }
        set {
            Settings.shared.password = newValue
        }
    }
    
    var userProfile: UserProfile {
        get {
            return Settings.shared.userProfile
        }
        set {
            Settings.shared.userProfile = newValue
        }
    }
}
