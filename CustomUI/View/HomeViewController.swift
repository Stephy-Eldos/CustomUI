//
//  HomeViewController.swift
//  CustomUI
//
//  Created by Eldos Thomas on 28/4/22.
//

import UIKit
import CustomUIFramework

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var labelWelcome: Bold24Label!
    @IBOutlet weak var labelEmployeeId: Regular16Label!
    @IBOutlet weak var labelFirstName: Regular16Label!
    @IBOutlet weak var labelLastName: Regular16Label!
    @IBOutlet weak var labelMobileNo: Regular16Label!
    @IBOutlet weak var labelEmailAddress: Regular16Label!
    var viewModel = HomeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        navigationController?.navigationBar.isHidden = true
        let userProfile = viewModel.userProfile
        labelWelcome.text = "Welcome \(userProfile.fullName)!"
        labelEmployeeId.text = "Employee ID : \(userProfile.employeeId ?? "")"
        labelFirstName.text = "First Name : \(userProfile.firstName ?? "")"
        labelLastName.text = "Last Name : \(userProfile.lastName ?? "")"
        labelMobileNo.text = "Mobile No. : \(userProfile.mobileNumber ?? "")"
        labelEmailAddress.text = "Email Address : \(userProfile.emailAddress ?? "")"
    }
    
    @IBAction func onLogoutTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


