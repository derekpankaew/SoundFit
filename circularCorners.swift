//
//  circularCorners.swift
//  SpeakToMe
//
//  Created by Derek Pankaew on 1/22/17.
//  Copyright © 2017 Henry Mason. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class circularCorners: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet {
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder () {
        setupView()
    }
    
    func setupView () {
        layer.cornerRadius = cornerRadius
        layer.borderColor = UIColor.gray.cgColor;
        layer.borderWidth = 0.5;
        
        layer.contentsScale = UIScreen.main.scale;
        layer.shadowColor = UIColor.black.cgColor;
        layer.shadowRadius = 2.0;
        layer.shadowOpacity = 0.1;
        layer.shadowOffset = CGSize(width: 1, height: 5)
    }
    
    
    
}


