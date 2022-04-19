//
//  UnderLinedButton.swift
//  CustomUI
//
//  Created by Eldos Thomas on 19/4/22.
//

import UIKit

@IBDesignable class UnderLinedButton: UIButton {

        private var underLineLayer: CALayer? = nil
        
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
            underLineLayer?.removeFromSuperlayer()
            underLineLayer = CALayer()
            
            if let underLineLayer = underLineLayer {
                underLineLayer.frame = CGRect(x: 12, y: frame.size.height-7, width: frame.size.width, height: 1)
                underLineLayer.backgroundColor = titleColor(for: .normal)?.cgColor
                layer.addSublayer(underLineLayer)
            }
        }
    }
