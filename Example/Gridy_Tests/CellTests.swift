import XCTest
import Gridy


class CellTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func testInitializer() {
        let cell = Cell(x: 10, y: -5)
        XCTAssertEqual(cell.x, 10)
        XCTAssertEqual(cell.y, -5)
    }
    
    func testEquatable() {
        let cell1 = Cell(x: 1, y: 1)
        let cell2 = cell1
        let cell3 = Cell(x: 0, y: 0)
        XCTAssertEqual(cell1, cell2)
        XCTAssertNotEqual(cell1, cell3)
    }

    func testDescription() {
        let cell = Cell(x: 100, y: 200)
        XCTAssertEqual(cell.description, "(100, 200)")
    }
}
