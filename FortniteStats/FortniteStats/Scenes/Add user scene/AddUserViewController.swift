//
//  ViewController.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 12/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import UIKit

protocol AddUserDisplayLogic: class {
    func displayLoading(viewModel: AddUser.ShowLoading.ViewModel)
    func presentErrors(viewModel: AddUser.ShowErrors.ViewModel)
    func presentSuccesUser(viewModel: AddUser.Add.ViewModel)
}

class AddUserViewController: UIViewController, AddUserDisplayLogic, Alertable {
    
    // MARK: - Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var platformSegmentedControl: PlatformSegmentedControl! 
    
    var interactor: AddUserBusinessLogic?
    var router: (AddUserRoutingLogic & AddUserDataPassing)?
    var alertView: UIAlertController?
    
    // MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        AddUserConfigurator.shareInstance.configure(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        AddUserConfigurator.shareInstance.configure(self)
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - AddUserDisplayLogic
    
    func displayLoading(viewModel: AddUser.ShowLoading.ViewModel) {
        
        if viewModel.isLoading {
            showProgressView(controller: &alertView)
        } else {
            self.alertView?.dismiss(animated: false, completion: nil)
        }
        
    }
    
    func presentErrors(viewModel: AddUser.ShowErrors.ViewModel) {
        alertView?.dismiss(animated: false ) {
            self.showAlert(message: viewModel.text, controller: &self.alertView)
        }
        
    }
    
    func presentSuccesUser(viewModel: AddUser.Add.ViewModel) {
        alertView?.dismiss(animated: false ) {
            self.router?.routeToHome()
        }
        
    }
    
}

// MARK: - TextFieldDelegate

extension AddUserViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let platform = platformSegmentedControl.selectedValue.getString()
        let username = textField.text
        
        let request = AddUser.Add.Request(username: username, platform: platform)
        interactor?.addUser(request: request)
        
        return true
    }
    
}
