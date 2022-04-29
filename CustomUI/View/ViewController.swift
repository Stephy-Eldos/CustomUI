//
//  ViewController.swift
//  CustomUI
//
//  Created by Eldos Thomas on 19/4/22.
//

import UIKit
import CustomUIFramework

class ViewController: UIViewController {
    
    @IBOutlet weak var inputFieldUsername: InputField!
    @IBOutlet weak var inputFieldPassword: InputField!
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
    }
    
    func setUpUi() {
        let twoLineButton = TwoLinedButton(frame: CGRect(x: 0, y: 0, width: 220, height: 55))
        view.addSubview(twoLineButton)
        twoLineButton.center = view.center
        twoLineButton.primaryText = "Start Free Trial"
        twoLineButton.secondaryText = "1 day free"
        twoLineButton.backgroundColor = .systemTeal
    }
    
    @IBAction func onLoginTapped(_ sender: Any) {
        if !inputFieldUsername.text!.isEmpty {
            if !inputFieldPassword.text!.isEmpty {
                if viewModel.username == inputFieldUsername.text {
                    if viewModel.password == inputFieldPassword.text {
                    
                        let signUpVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                        self.navigationController?.pushViewController(signUpVC, animated: true)
                        
                    } else {
                        PopAlertView.popWithTitle(message: Constants.AlertMessage.incorrectPassword) {
                            Void()
                        }
                    }
                } else {
                    PopAlertView.popWithTitle(message: Constants.AlertMessage.NotRegisteredUser) {
                        Void()
                    }
                }
            } else {
                PopAlertView.popWithTitle(message: Constants.AlertMessage.enterPassword) {
                    Void()
                }
            }
        } else {
            PopAlertView.popWithTitle(message: Constants.AlertMessage.enterEmail) {
                Void()
            }
        }
    }
}

