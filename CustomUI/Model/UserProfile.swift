//
//  UserProfile.swift
//  CustomUI
//
//  Created by Eldos Thomas on 28/4/22.
//

import Foundation

struct UserProfile {
    var firstName: String? = ""
    var lastName: String? = ""
    var mobileNumber: String? = ""
    var employeeId: String? = ""
    var emailAddress: String? = ""
    }

extension UserProfile {
    var fullName: String {
        get {
            return "\(firstName ?? "") \(lastName ?? "")"
        }
    }
}

extension UserProfile: Codable {
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case mobileNumber
        case employeeId
        case emailAddress
    }
}

