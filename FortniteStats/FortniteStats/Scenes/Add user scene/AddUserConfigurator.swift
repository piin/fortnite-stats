//
//  AddUserConfigurator.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 4/17/19.
//  Copyright © 2019 Jair Pinedo. All rights reserved.
//

import Foundation
import UIKit

final class AddUserConfigurator {
    static let shareInstance = AddUserConfigurator()
    
    init () {}
    
    func configure(_ control: AddUserViewController ) {
        let viewcontroller = control
        let interactor = AddUserInteractor()
        let presenter = AddUserPresenter()
        let router = AddUserRouter()
        viewcontroller.interactor = interactor
        viewcontroller.router = router
        interactor.presenter = presenter
        presenter.viewController = viewcontroller
        router.viewController = viewcontroller
        router.dataStore = interactor
    }
    
}
