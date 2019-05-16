//
//  HomeTabPresenter.swift
//  FortniteStats
//
//  Created by Jair Pinedo on 5/9/19.
//  Copyright (c) 2019 Jair Pinedo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeTabPresentationLogic {
    func presentSomething(response: HomeTab.Something.Response)
}

class HomeTabPresenter: HomeTabPresentationLogic {
    weak var viewController: HomeTabDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: HomeTab.Something.Response) {
        let viewModel = HomeTab.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
