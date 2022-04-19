//
//  ViewController.swift
//  CustomUI
//
//  Created by Eldos Thomas on 19/4/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
let twoLineButton = TwoLinedButton(frame: CGRect(x: 0, y: 0, width: 220, height: 55))
        view.addSubview(twoLineButton)
        twoLineButton.center = view.center
        twoLineButton.configure(with: TwoLinedButtonViewModel(
            primaryText: "Start Free Trial",
            secondaryText: "1 day free",
            backgroundColor: .systemBlue,
            primaryTextColor: .white,
            secondaryTextColor: .white
        ))
    }
}

