//
//  HomeViewModel.swift
//  CustomUI
//
//  Created by Eldos Thomas on 28/4/22.
//

import Foundation

class HomeViewModel {
    
    var userProfile: UserProfile {
        get {
            return Settings.shared.userProfile
        }
    }
}
