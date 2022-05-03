//
//  HomeViewModel.swift
//  CustomUI
//
//  Created by Eldos Thomas on 28/4/22.
//

import Foundation

class AccountsViewModel {
    var displayedData = [Accounts]()
    var userProfile: UserProfile {
        get {
            return Settings.shared.userProfile
        }
    }
    
    init() {
        setUpDummyData()
    }
}

extension AccountsViewModel: Dummyable  {
    func setUpDummyData() {
        let data1 = Accounts(name: "Assets", value: "$25,53343.00")
        let data2 = Accounts(name: "Liabilities", value: "$3,434.00")
        displayedData = [data1,data2]
    }
}
