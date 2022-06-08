//
//  RootViewController.swift
//  CustomUI
//
//  Created by Eldos Thomas on 2/5/22.
//

import UIKit
import CustomUIFramework

class RootViewController: UIViewController {

    @IBOutlet var navigationBar: NavigationBar! = nil
    @IBOutlet var navigationTab: NavigationTab! = nil
    @IBOutlet var containerView: UIView! = nil
    @IBOutlet weak var constraintNavigationViewHeight: NSLayoutConstraint!
    @IBOutlet weak var constraintNavigationTabHeight: NSLayoutConstraint!
    
    var containerNavigationController = UINavigationController()
    var navigationRouter: NavigationRouter?
    var isNavigationBarHidden: Bool = false {
        didSet {
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.constraintNavigationViewHeight.constant = self?.isNavigationBarHidden ?? false ? 0 : 50
            }
            
        }
    }
    
    var isNavigationTabHidden: Bool = false {
        didSet {
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.constraintNavigationTabHeight.constant = self?.isNavigationTabHidden ?? false ? 0 : 60
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        setUpRootAndRoute()
        setUpHorizontalNavigationBar()
    }
    
    func setUpRootAndRoute() {
 //       navigationBar.rootViewController = self
        navigationRouter = NavigationRouter(rootViewController: self)
        navigationRouter?.loadViewControllerFromStoryboard(type: InsightsViewController.self)
    }
    
    func setUpHorizontalNavigationBar() {
        let navItemWidth = UIScreen.main.bounds.width/3
        let items = [
            NavigationTabItem(title: "Portfolio", image: UIImage(named: "home"), action: {
            self.navigationRouter?.loadViewControllerFromStoryboard(type: HomeViewController.self)

        }, width: navItemWidth),
        NavigationTabItem(title: "Insights", image: UIImage(named: "box"), action: {
            self.navigationRouter?.loadViewControllerFromStoryboard(type: InsightsViewController.self)
            
        }, width: navItemWidth),
        NavigationTabItem(title: "Profile", image: UIImage(named: "user"), action: {
            self.navigationRouter?.loadViewControllerFromStoryboard(type: ProfileViewController.self)

            }, width: navItemWidth)]
        navigationTab.items = items

    }
}
