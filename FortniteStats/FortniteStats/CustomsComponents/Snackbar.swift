//
//  Snackbar.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 30/05/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import UIKit

class Snackbar {
    
    static let heightView:CGFloat = 40
    static let backgroundColor = UIColor.darkGray
    
    // MARK: - Propertiers
    private var viewController: UIViewController
    private var view: UIView
    private var label: UILabel
    private var size: (height:CGFloat, width:CGFloat )
    
    /**
     Create a Snackbar in an specific viewController
     - parameters:
         - viewController: UIViewController
        - message: String
     */
    init(viewController: UIViewController, message: String) {
        self.viewController = viewController
        size.height = viewController.view.frame.height
        size.width = viewController.view.frame.width
        
        self.view = UIView(frame: CGRect(x: 0, y: size.height, width: size.width, height: Snackbar.heightView))
        self.label = UILabel(frame: CGRect(x: 20, y: 0,width: size.width, height: Snackbar.heightView))
        self.label.text = message
        
        self.view.addSubview(label)
        self.view.backgroundColor = Snackbar.backgroundColor
        
        self.viewController.view.addSubview(view)

    }
    
    /**
     Show the snackbar at the bottom of the screen and change the default message
     - parameters:
        - message: String
     */
    func show(message:String) {
        self.label.text = message
        UIView.animate(withDuration: 0.2) {
            self.view.frame = CGRect(x: 0, y: self.size.height - Snackbar.heightView,
                                     width: self.size.width, height: Snackbar.heightView)
        }
    }
    
    /**
     Show the snackbar at the bottom of the screen
     */
    func show() {
        if view.superview == nil {
            self.viewController.view.addSubview(view)
        }
        
        UIView.animate(withDuration: 0.2) {
            self.view.frame = CGRect(x: 0, y: self.size.height - Snackbar.heightView,
                                     width: self.size.width, height: Snackbar.heightView)
        }
    }
    
    /**
     Hide the snackbar and removeFromSuperview
     */
    func dismiss() {
        UIView.animate(withDuration: 0.2, animations: {
            self.view.frame = CGRect(x: 0, y: self.size.height ,
                                     width: self.size.width, height: Snackbar.heightView)
        }) { (success) in
            self.view.removeFromSuperview()
        }
    }
    
}
