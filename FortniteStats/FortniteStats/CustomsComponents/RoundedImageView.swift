//
//  RoundedImageView.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 2/4/19.
//  Copyright © 2019 Jair Pinedo. All rights reserved.
//

import UIKit

 @IBDesignable class RoundedImageView: UIImageView {
    
    // MARK: Properties
    @IBInspectable var borderWith: CGFloat = 0 {
        didSet {
            roundBorder()
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            roundBorder()
        }
    }
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    // MARK: Methods
    /**
     Make the layer of the UIImageView as a circle and add a border.
     */
    private func roundBorder() {
        layer.cornerRadius = frame.width / 2
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWith
    }
    
    
}
