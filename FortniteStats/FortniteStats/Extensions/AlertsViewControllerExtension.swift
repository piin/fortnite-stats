//
//  File.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 03/05/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import UIKit

protocol Alertable {
    var alertView: UIAlertController? { get set }
}

extension Alertable where Self: UIViewController {
    
    /**
     Present an alert with a simple "OK" button
     - parameters:
        - message: String?
     */
    func showAlert(message:String?, controller: inout UIAlertController? ) {
        controller = UIAlertController(title: "Fortnite stats", message: message, preferredStyle: .alert)
        controller?.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(controller!, animated: true, completion: .none)
    }
    
    /**
     Present an alert with the text "Please wait..."
     */
    func showProgressView(controller: inout UIAlertController?) {
        controller = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating()
        
        controller?.view.addSubview(loadingIndicator)
        present(controller!, animated: false, completion: .none)
    }
    
}
