//
//  TextImageButton.swift
//  CustomUI
//
//  Created by Eldos Thomas on 19/4/22.
//

import UIKit

@IBDesignable class RoundedButton: UIButton {
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    override func prepareForInterfaceBuilder() {
        setUp()
    }
    
    private func setUp() {
        layer.cornerRadius = frame.size.height / 2
        backgroundColor = .black
        titleLabel?.adjustsFontSizeToFitWidth = true
    }
}

