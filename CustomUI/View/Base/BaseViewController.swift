//
//  BaseViewController.swift
//  CustomUI
//
//  Created by Eldos Thomas on 2/5/22.
//

import UIKit
import CustomUIFramework

class BaseViewController: UIViewController {
    
        weak var rootViewController: RootViewController? = nil
        weak var navigationRouter: NavigationRouter? {
            get {
                rootViewController?.navigationRouter
            }
        }
        
        var navigationItems: [NavigationViewItem]? {
            didSet {
                rootViewController?.navigationBar.items = navigationItems
            }
        }
        
        var isNavigationBarHidden = false
        var isNavigationTabHidden = false
        
        
        override func viewDidLoad() {
            isNavigationBarHidden = false
            isNavigationTabHidden = false
            navigationItems = navigationLogout
        }
        
        override func viewWillAppear(_ animated: Bool) {
            rootViewController?.navigationBar.items = navigationItems
            rootViewController?.navigationBar?.title = title
            rootViewController?.isNavigationBarHidden = isNavigationBarHidden
            rootViewController?.isNavigationTabHidden = isNavigationTabHidden
        }
        
        deinit {
            print("deinit")
        }
    }

    extension BaseViewController {
        var navigationLogout: [NavigationViewItem] {
            get {
                let items = [NavigationViewItem(image: UIImage(named: Assets.Keys.Logout), action: { [weak self] in
                    PopAlertViewTwoActions.popWithTwoActions(message: Constants.AlertMessage.signoutMessage, affirmTitle: Constants.AlertMessage.signoutButton, affirmTitle2: Constants.AlertMessage.cancelButton,
                        actionFirstButton: {
                        self?.rootViewController?.navigationRouter?.loadViewControllerFromStoryboard(type: MainViewController.self)
                    },
                        actionSecondButton: {
                        Void()
                    })
                })]
                return items
            }
        }
    }
