//
//  XCTestExtensions.swift
//  StantUiIosLibraryDemoTests
//
//  Created by Alexandre Henrique on 7/2/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import XCTest

extension XCTestCase {
    func given(_ description: String, closure: () throws -> Void) throws {
        try closure()
    }
    
    func when(_ description: String, closure: () throws -> Void) throws {
        try closure()
    }
    
    func then(_ description: String, closure: () throws -> Void) throws {
        try closure()
    }
}
