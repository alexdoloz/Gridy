import XCTest
@testable import Gridy


class Grid4Tests: XCTestCase {
    var testGrid: Grid4!
    
    override func setUp() {
        super.setUp()
        
        testGrid = Grid4()
        testGrid.width = 4.0
        testGrid.height = 8.0
        testGrid.spaceX = 10.0
        testGrid.spaceY = 0.0
        testGrid.anchorPoint = CGPoint(x: 10.0, y: 10.0)
        testGrid.anchorMode = .origin
        testGrid.anchorCell = Cell()
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
    
    func testRectForCell1() {
        var grid = testGrid
        
        let rect = grid.rectForCell(Cell(x: 3, y: 3))
        XCTAssertEqualWithAccuracy(rect.origin.x, 52.0, accuracy: 0.5)
        XCTAssertEqualWithAccuracy(rect.origin.y, 34.0, accuracy: 0.5)
        XCTAssertEqualWithAccuracy(rect.size.width, grid.width, accuracy: 0.5)
        XCTAssertEqualWithAccuracy(rect.size.height, rect.height, accuracy: 0.5)
    }
    
    func testRectForCell2() {
        var grid = testGrid
        grid.anchorMode = .center
        let rect = grid.rectForCell(Cell(x: 3, y: 3))
        XCTAssertEqualWithAccuracy(rect.origin.x, 50.0, accuracy: 0.5)
        XCTAssertEqualWithAccuracy(rect.origin.y, 30.0, accuracy: 0.5)
    }
    
    func testRectForCell3() {
        var grid = testGrid
        grid.anchorCell = Cell(x: 10, y: 10)
        grid.anchorMode = .originWithSpace
        grid.spaceX = 22.0
        grid.spaceY = 30.0

        let rect = grid.rectForCell(grid.anchorCell)
        XCTAssertEqualWithAccuracy(rect.origin.x, -1.0, accuracy: 0.5)
        XCTAssertEqualWithAccuracy(rect.origin.y, -5.0, accuracy: 0.5)
    }
    
}
