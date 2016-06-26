import Foundation
import CoreGraphics


/** Defines 2d cell with `Int` coordinates.*/
public struct Cell {
    public var x = 0
    public var y = 0
    
    public var point: CGPoint {
        return CGPoint(x: x, y: y)
    }
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    public init() {}
}


extension Cell: CustomStringConvertible {
    public var description: String {
        return "(\(x), \(y))"
    }
}


extension Cell: Hashable {
    public var hashValue: Int {
        return x ^ y
    }
}


// MARK: Operators

public func == (lhs: Cell, rhs: Cell) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}


