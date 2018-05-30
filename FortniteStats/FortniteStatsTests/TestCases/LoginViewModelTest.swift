//
//  FortniteStatsTests.swift
//  FortniteStatsTests
//
//  Created by Jair Pinedo on 12/04/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import XCTest
@testable import FortniteStats

class FortniteStatsTests: XCTestCase {
    
    private var viewModel: LoginViewModel!
    private var repository: LoginRepositoryMock!
    
    private var validUserName = "piin"
    private var platform = "pc"
    private var invalidUserName = "p"
    
    override func setUp() {
        super.setUp()
        repository = LoginRepositoryMock()
        viewModel = LoginViewModel(repository: repository)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testValidateUserName() {
        let areErrors = viewModel.validateUserName(userName: validUserName)
        XCTAssertNil(areErrors, "Invalid Fortnite name")
    }
    
    func testInvalidUserName() {
        let areErrors = viewModel.validateUserName(userName: invalidUserName)
        XCTAssertNotNil(areErrors, "Valid Fortnite name")
    }

    func testLogin() {
        viewModel.login(userName: validUserName, platform: platform) { (result) in
            switch result {
            case .Success(let user):
                XCTAssertNotNil(user, "Error with the user")
            case .Failure(let error):
                 XCTAssertNil(error, "Error with the error")
            }
        }
    }
    
}
