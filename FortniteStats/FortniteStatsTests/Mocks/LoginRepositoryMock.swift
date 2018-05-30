//
//  LoginRepositoryMock.swift
//  FortniteStatsTests
//
//  Created by Jair Pinedo on 11/05/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import XCTest
@testable import FortniteStats

class LoginRepositoryMock: LoginRepository, Stubs {
    
    private var userModelTest: UserModel!

    override init() {
        super.init()
        let data = loadStubFromBundle(withName: "User", extension: "json")
        self.userModelTest  = try! JSONDecoder().decode(UserModel.self, from: data)
    }
    
    override func login(userName: String, platform: String, completionHandler: @escaping (Result<UserModel>) -> ()) {
        completionHandler( .Success(self.userModelTest))
    }
    
}

