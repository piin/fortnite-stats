//
//  File.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 03/05/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /**
     Present an alert with a simple "OK" button
     - parameters:
        - message: String?
     */
    func showAlert(message:String?) {
        let alert = UIAlertController(title: "Fortnite stats", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    /**
     Present an alert with the text "Please wait..."
     */
    func showProgressView() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
}
