import Foundation
import CoreGraphics


/** Defines 2d cell with `Int` coordinates.*/
public struct Cell {
    var x = 0
    var y = 0
    
    var point: CGPoint {
        return CGPoint(x: x, y: y)
    }
}


extension Cell: CustomStringConvertible {
    public var description: String {
        return "(\(x), \(y))"
    }
}


extension Cell: Equatable {}


// MARK: Operators

public func == (lhs: Cell, rhs: Cell) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}