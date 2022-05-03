//
//  HomeViewController.swift
//  CustomUI
//
//  Created by Eldos Thomas on 2/5/22.
//

import UIKit

class HomeViewController: BaseViewController  {
    
    @IBOutlet weak var labelWelcome: UILabel!
    var viewModel = AccountsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setupUI() {
        labelWelcome.text = "Welcome, \(viewModel.userProfile.fullName) !..."
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.displayedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        let item = viewModel.displayedData[indexPath.row]
        cell.accounts = item
        
 //       cell.backgroundColor = indexPath.row%2 == 0 ? UIColor.systemGray6 : UIColor.white
        
        return cell
    }
}

extension HomeViewController: NibableViewController {
    static func instantateFromNib() -> BaseViewController {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        return viewController
    }
}

