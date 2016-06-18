//
//  GridyTests.swift
//  GridyTests
//
//  Created by Alexander on 18.06.16.
//  Copyright © 2016 Alexander. All rights reserved.
//

import XCTest
@testable import Gridy


class GridyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testSetWidth() {
        var grid = Grid4()
        grid.width = 5
        XCTAssertEqual(grid.width, 5.0)
        XCTAssertEqual(grid.height, 1.0)
    }
    
    func testSetHeight() {
        var grid = Grid4()
        grid.height = 10
        XCTAssertEqual(grid.width, 1.0)
        XCTAssertEqual(grid.height, 10.0)
    }
    
    func testSetDimension() {
        var grid = Grid4()
        grid.setDimension(100.0)
        XCTAssertEqual(grid.width, grid.height)
        XCTAssertEqual(grid.height, 100.0)
    }
    
    func testSetSpace() {
        var grid = Grid4()
        grid.setSpace(10.0)
        XCTAssertEqual(grid.spaceX, grid.spaceY)
        
        grid.setSpace(0.0)
        XCTAssertEqual(grid.spaceX, 0.0)
    }
    
    
}
