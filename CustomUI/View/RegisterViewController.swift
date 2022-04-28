//
//  RegisterViewController.swift
//  CustomUI
//
//  Created by Eldos Thomas on 25/4/22.
//

import UIKit
import CustomUIFramework

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var inputFieldUsername: InputField!
    @IBOutlet weak var inputFieldPassword: InputField!
    @IBOutlet weak var inputFieldConfirmPassword: InputField!
    @IBOutlet weak var inputFieldFirstName: InputField!
    @IBOutlet weak var inputFieldLastName: InputField!
    @IBOutlet weak var inputFieldEmployeeID: InputField!
    @IBOutlet weak var inputFieldMobileNo: InputField!
    @IBOutlet weak var labelPasswordMatched: UILabel!
    
    var viewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        inputFieldPassword.textField.delegate = self
        inputFieldConfirmPassword.textField.delegate = self
        labelPasswordMatched.isHidden = true
    }
    
    
    @IBAction func onRegisterTapped(_ sender: Any) {
        if !inputFieldUsername.text!.isEmpty || !inputFieldPassword.text!.isEmpty || !inputFieldConfirmPassword.text!.isEmpty || !inputFieldFirstName.text!.isEmpty || !inputFieldLastName.text!.isEmpty || !inputFieldEmployeeID.text!.isEmpty || !inputFieldMobileNo.text!.isEmpty {
            if EmailValidator.validate(input: inputFieldUsername.text) {
                if !labelPasswordMatched.isHidden {
                    if MobileValidator.validate(input: inputFieldMobileNo.text) {
                        PopAlertView.popWithTitle(message: StringConstants.AlertMessage.registerSuccess) {
                            self.saveData()
                            self.dismiss(animated: true)
                        }
                    } else {
                        PopAlertView.popWithTitle(message: StringConstants.AlertMessage.notValidMobile) {
                            Void()
                        }
                    }
                } else {
                    PopAlertView.popWithTitle(message: StringConstants.AlertMessage.passwordMismatch) {
                        Void()
                    }
                }
            } else {
                PopAlertView.popWithTitle(message: StringConstants.AlertMessage.notValidEmail) {
                    Void()
                }
            }
        } else {
            PopAlertView.popWithTitle(message: StringConstants.AlertMessage.fillAllFields) {
                Void()
            }
        }
    }
    
    func saveData() {
        self.viewModel.username = self.inputFieldUsername.text!
        self.viewModel.password = self.inputFieldPassword.text!
        var userProfile = self.viewModel.userProfile
        userProfile.firstName = self.inputFieldFirstName.text!
        userProfile.lastName = self.inputFieldLastName.text!
        userProfile.employeeId = self.inputFieldEmployeeID.text!
        userProfile.emailAddress = self.inputFieldUsername.text!
        userProfile.mobileNumber = self.inputFieldMobileNo.text!
        Settings.shared.userProfile = userProfile
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            var otherTextField = inputFieldPassword.textField
            if textField == otherTextField {
                otherTextField = inputFieldConfirmPassword.textField
            }
            labelPasswordMatched.isHidden = otherTextField.text != updatedText || text.count == 0
        }
        return true
    }
}
