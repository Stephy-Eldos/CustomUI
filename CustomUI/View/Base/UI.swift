//
//  UI.swift
//  CustomUI
//
//  Created by Eldos Thomas on 2/5/22.
//

import Foundation

protocol Nibable {
    static func instantateFromNib() -> BaseViewController
}

struct Assets {
    struct Keys {
        static var Logout = "logout"
    }
}
