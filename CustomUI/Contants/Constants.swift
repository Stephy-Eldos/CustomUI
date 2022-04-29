//
//  StringContants.swift
//  CustomUI
//
//  Created by Eldos Thomas on 25/4/22.
//

import Foundation

public struct Constants {
    
    public struct Limits {
      static let MobileMinLength = 8
      static let MobileMaxLength = 16
      static let PasswordMinChar = 6
      static let PasswordMaxChar = 15
    }
    
    public struct AlertMessage {
        public static let loginSuccess = "Login Success"
        public static let notValidEmail = "This is not a valid email address"
        public static let notValidMobile = "Mobile Number is not valid"
        public static let enterEmail = "Please enter a valid email address"
        public static let enterPassword = "Please enter a password"
        public static let fillAllFields = "Please fill all the fields"
        public static let registerSuccess = "Successfully Registered"
        public static let passwordMismatch = "Password Mismatch"
        public static let NotRegisteredUser = "Not a registered user. Please enter the registered email address"
        public static let incorrectPassword = "Incorrect Password"
    }
}
