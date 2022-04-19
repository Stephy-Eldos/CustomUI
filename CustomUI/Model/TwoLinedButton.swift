//
//  TwoLinedButton.swift
//  CustomUI
//
//  Created by Eldos Thomas on 19/4/22.
//

import UIKit

class TwoLinedButton: UIButton {
        let primaryLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 1
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 20, weight: .semibold)
            return label
        }()
        
        let secondaryLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 1
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 18, weight: .regular)
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(primaryLabel)
            addSubview(secondaryLabel)
            clipsToBounds = true
            layer.cornerRadius = 8
            layer.borderWidth = 1
            layer.borderColor = UIColor.secondarySystemBackground.cgColor
        }
        
        required init?(coder: NSCoder) {
            fatalError()
        }
        
        func configure(with viewModel: TwoLinedButtonViewModel) {
            primaryLabel.text = viewModel.primaryText
            primaryLabel.textColor = viewModel.primaryTextColor
            secondaryLabel.text = viewModel.secondaryText
            secondaryLabel.textColor = viewModel.secondaryTextColor
            backgroundColor = viewModel.backgroundColor
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            primaryLabel.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height/2)
            secondaryLabel.frame = CGRect(x: 0, y: frame.size.height/2, width: frame.size.width, height: frame.size.height/2)
        }

    }

