//
//  Settings.swift
//  CustomUI
//
//  Created by Eldos Thomas on 28/4/22.
//


import Foundation
import Security

enum SettingKeys: String {
    case UserProfile = "UserProfile"
    case FirstName = "FirstName"
    case LastName = "LastName"
    case EmployeeId = "EmployeeId"
    case EmailAddress = "EmailAddress"
    case MobileNumber = "MobileNumber"
}

enum SecureKeys: String {
    case Username = "Username"
    case Password = "Password"
}

class Settings{
    
    static let shared = Settings()
    @UserDefault(SettingKeys.UserProfile.rawValue, defaultValue: UserProfile()) var userProfile: UserProfile
    @UserDefault(SettingKeys.FirstName.rawValue, defaultValue: "") var firstName: String
    @UserDefault(SettingKeys.LastName.rawValue, defaultValue: "") var lastName: String
    @UserDefault(SettingKeys.EmployeeId.rawValue, defaultValue: "") var employeeId: String
    @UserDefault(SettingKeys.EmailAddress.rawValue, defaultValue: "") var emailAddress: String
    @UserDefault(SettingKeys.MobileNumber.rawValue, defaultValue: "") var mobileNumber: String
    
    @SecureDefaults(SecureKeys.Username.rawValue, defaultValue: "") var username: String
    @SecureDefaults(SecureKeys.Password.rawValue, defaultValue: "") var password: String
}

@propertyWrapper struct UserDefault<T: Codable> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            if let data = UserDefaults.standard.object(forKey: key) as? Data,
                let value = try? JSONDecoder().decode(T.self, from: data) {
                return value

            }
            return  defaultValue
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
    }
}

@propertyWrapper struct SecureDefaults<T: Codable> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            if let data = KeyChain.load(key: key),
                let value = try? JSONDecoder().decode(T.self, from: data) {
                return value

            }
            return  defaultValue
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                _ = KeyChain.save(key: key, data: encoded)
            }
        }
    }
}

