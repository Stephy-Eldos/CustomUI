//
//  ViewController.swift
//  CustomUI
//
//  Created by Eldos Thomas on 19/4/22.
//

import UIKit
import InputField
import PopAlertView
import ValidatorFramework

class ViewController: UIViewController {
    
    @IBOutlet weak var inputFieldUsername: InputField!
    @IBOutlet weak var inputFieldPassword: InputField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
    }
    
    func setUpUi() {
        let twoLineButton = TwoLinedButton(frame: CGRect(x: 0, y: 0, width: 220, height: 55))
        view.addSubview(twoLineButton)
        twoLineButton.center = view.center
        twoLineButton.configure(with: TwoLinedButtonViewModel(
            primaryText: "Start Free Trial",
            secondaryText: "1 day free",
            backgroundColor: .systemTeal,
            primaryTextColor: .white,
            secondaryTextColor: .white
        ))
    }
    
    @IBAction func onLoginTapped(_ sender: Any) {
        if !inputFieldUsername.text!.isEmpty {
            if !inputFieldPassword.text!.isEmpty {
                if EmailValidator.validate(input: inputFieldUsername.text) {
                    PopAlertView.popWithTitle(message: StringConstants.AlertMessage.loginSuccess) {
                        Void()
                    }
                } else {
                    PopAlertView.popWithTitle(message: StringConstants.AlertMessage.notValidEmail) {
                        Void()
                    }
                }
            } else {
                PopAlertView.popWithTitle(message: StringConstants.AlertMessage.enterPassword) {
                    Void()
                }
            }
        } else {
            PopAlertView.popWithTitle(message: StringConstants.AlertMessage.enterEmail) {
                Void()
            }
        }
    }
}

