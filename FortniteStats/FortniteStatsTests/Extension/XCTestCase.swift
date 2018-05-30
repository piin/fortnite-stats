//
//  XCTestCase.swift
//  FortniteStatsTests
//
//  Created by Jair Pinedo on 11/05/18.
//  Copyright © 2018 Jair Pinedo. All rights reserved.
//

import XCTest

protocol Stubs { }

extension Stubs {
    
    func loadStubFromBundle(withName name: String, extension: String) -> Data {
        let bundle = Bundle(for: type(of: self) as! AnyClass)
        let url = bundle.url(forResource: name, withExtension: `extension`)
        return try! Data(contentsOf: url!)

    }
}

