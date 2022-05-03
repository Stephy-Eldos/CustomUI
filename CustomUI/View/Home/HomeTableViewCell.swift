//
//  HomeTableViewCell.swift
//  CustomUI
//
//  Created by Eldos Thomas on 4/5/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelLeft: UILabel!
    @IBOutlet weak var labelRight: UILabel!
    
    var accounts: Accounts? = nil {
        didSet {
            labelLeft.text = accounts?.name
            labelRight.text = accounts?.value
        }
    }


}
