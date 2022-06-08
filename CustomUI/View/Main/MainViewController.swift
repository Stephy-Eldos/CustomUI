//
//  ViewController.swift
//  CustomUI
//
//  Created by Eldos Thomas on 19/4/22.
//

import UIKit
import CustomUIFramework

class MainViewController: BaseViewController {
    
    @IBOutlet weak var inputFieldUsername: InputField!
    @IBOutlet weak var inputFieldPassword: InputField!
    @IBOutlet var containerLogin: UIView!
    @IBOutlet weak var textViewDesc: UITextView!
    @IBOutlet weak var buttonArrow: UIButton!
    
    var containerView = UIView()
    var containerLoginHeight : CGFloat = 350
    var keyboardPresent : Bool = false
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        setUpUi()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyBoardFrameHeight = keyboardSize.size.height
            if self.containerLogin.frame.origin.y != 0 {
                if keyboardPresent == false {
                self.containerLogin.frame.origin.y = (containerLogin.frame.origin.y) - keyBoardFrameHeight
                keyboardPresent = true
                }
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        let screenSize = UIScreen.main.bounds.size
        if self.containerLogin.frame.origin.y != 0 {
            self.containerLogin.frame.origin.y = screenSize.height - self.containerLoginHeight
            keyboardPresent = false
        }
    }
    
    func setUpUi() {
        createHyperlinkText()
        isNavigationBarHidden = true
        isNavigationTabHidden = true
        containerLogin.layer.cornerRadius = 5
    }
    
    func createHyperlinkText() {
        let attributedString = NSMutableAttributedString(string: "Please enter the User ID you would like to pair to this device. Learn more")
        let url = URL(string: "https://www.apple.com")!
        attributedString.setAttributes([.link: url], range: NSMakeRange(64, 10))

        self.textViewDesc.attributedText = attributedString
        self.textViewDesc.isUserInteractionEnabled = true
        self.textViewDesc.isEditable = false
        self.textViewDesc.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
        self.textViewDesc.linkTextAttributes = [
            .foregroundColor: UIColor.blue,
 //           .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
    }
    
    
    @IBAction func buttonLoginWith(_ sender: Any) {
        let window = UIApplication.shared.keyWindow
          containerView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
          containerView.frame = self.view.frame
          
          window?.addSubview(containerView)
        
        let tapGesture = UITapGestureRecognizer(target: self,
                            action: #selector(slideUpViewTapped))
          containerView.addGestureRecognizer(tapGesture)
   //     buttonArrow.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(self.slideUpViewTapped)))
        
        containerView.alpha = 0
          UIView.animate(withDuration: 0.5,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
            self.containerView.alpha = 0.8
          }, completion: nil)
        
        
        let screenSize = UIScreen.main.bounds.size
        containerLogin.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: containerLoginHeight)
         window?.addSubview(containerLogin)
        
        UIView.animate(withDuration: 0.5,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
            self.containerView.alpha = 0.8
            self.containerLogin.frame = CGRect(x: 0, y: screenSize.height - self.containerLoginHeight, width: screenSize.width, height: self.containerLoginHeight)
          }, completion: nil)
    }
    
    @objc func slideUpViewTapped() {
        let screenSize = UIScreen.main.bounds.size
          UIView.animate(withDuration: 0.5,
                         delay: 0, usingSpringWithDamping: 1.0,
                         initialSpringVelocity: 1.0,
                         options: .curveEaseInOut, animations: {
            self.containerView.alpha = 0
              self.containerLogin.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.containerLoginHeight)
          }, completion: nil)
        inputFieldUsername.resignFirstResponder()
        inputFieldPassword.resignFirstResponder()
    }
    
    @IBAction func buttonContainerArrow(_ sender: Any) {
        slideUpViewTapped()
        inputFieldUsername.resignFirstResponder()
        inputFieldPassword.resignFirstResponder()
    }
    
    @IBAction func buttonCreateAccount(_ sender: Any) {
    }
    
    @IBAction func buttonActivateCard(_ sender: Any) {
    }
    
    @IBAction func onLoginTapped(_ sender: Any) {
        if !inputFieldUsername.text!.isEmpty {
            if !inputFieldPassword.text!.isEmpty {
                if viewModel.username == inputFieldUsername.text {
                    if viewModel.password == inputFieldPassword.text {
                        slideUpViewTapped()
                        self.navigationRouter?.loadViewControllerFromStoryboard(type: HomeViewController.self)
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
            PopAlertView.popWithTitle(message: Constants.AlertMessage.enterUserID) {
                Void()
            }
        }
    }
}

extension MainViewController: NibableViewController {
    static func instantateFromNib() -> BaseViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        return viewController
    }
}
