//
//  LoginViewControllerUITest.swift
//  FortniteStatsUITests
//
//  Created by Jair Pinedo on 10/05/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import XCTest

class LoginViewControllerUITest: XCTestCase {
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLogin() {
        let app = XCUIApplication()
        app.textFields["Enter your Fortnite name"].tap()
        sleep(2)
        app.textFields["Enter your Fortnite name"].typeText("piiin")
        app/*@START_MENU_TOKEN@*/.buttons["Go"]/*[[".keyboards",".buttons[\"Ir\"]",".buttons[\"Go\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
}
