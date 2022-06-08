//
//  ProfileViewController.swift
//  CustomUI
//
//  Created by Eldos Thomas on 5/5/22.
//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension ProfileViewController: NibableViewController {
    static func instantateFromNib() -> BaseViewController {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        return viewController
    }
}
