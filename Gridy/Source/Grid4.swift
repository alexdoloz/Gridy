import Foundation
import CoreGraphics


/** Defines infinite rectangle grid, consisting of cells which have integer coordinates. First you assign parameters to it (`width`, `space`, etc.), then you use various methods (i.e. `rectForCell(_:)`) which perform all the necessary math.*/
public struct Grid4 {
    
// MARK: Properties
    
    /// Width of the cell; must be >= 0; default is 1.0
    public var width: CGFloat = 1.0 {
        didSet {
            precondition(width > 0, "width must be > 0")
        }
    }
    
    /// Height of the cell; must be >= 0; default is 1.0
    public var height: CGFloat = 1.0 {
        didSet {
            precondition(height > 0, "height must be > 0")
        }
    }
    
    /// Horizontal space between cells. By default there is no space (0.0).
    public var spaceX: CGFloat = 0.0 {
        didSet {
            precondition(spaceX >= 0.0, "spaceX must be >= 0")
        }
    }
    
    /// Vertical space between cells. By default there is no space (0.0).
    public var spaceY: CGFloat = 0.0 {
        didSet {
            precondition(spaceY >= 0.0, "spaceY must be >= 0")
        }
    }
    
    /// Point to which `anchorCell` is anchored. See also `anchorMode`.
    public var anchorPoint: CGPoint = CGPointZero
    
    /// Defines a way how `anchorCell` is anchored
    public var anchorMode: AnchorMode = .origin
    
    /// Cell which is anchored to `anchorPoint`.
    public var anchorCell: Cell = Cell()
    
// MARK: Methods
    
    /// Sets `width` and `height` to `dimension`.
    public mutating func setDimension(dimension: CGFloat) {
        precondition(dimension >= 0)
        width = dimension
        height = dimension
    }
    
    /// Sets `spaceX` and `spaceY` to `space`.
    public mutating func setSpace(space: CGFloat) {
        spaceX = space
        spaceY = space
    }
    
    /// Calculates rect for given cell.
    public func rectForCell(cell: Cell) -> CGRect {
        let size = CGSize(width: width, height: height)
        let originX = anchorPoint.x + anchorSpaceX + (cell.point.x - anchorCell.point.x) * (width + spaceX)
        let originY = anchorPoint.y + anchorSpaceY + (cell.point.y - anchorCell.point.y) * (height + spaceY)
        let origin = CGPoint(x: originX, y: originY)
        return CGRect(origin: origin, size: size)
    }
    
    /// Finds all cells that contain given point. If point belongs to space between cells, it returns empty array.
    public func cellsForPoint(point: CGPoint) -> [Cell] {
        let cx = width + spaceX
        let dx1 = anchorPoint.x + anchorSpaceX - cx * anchorCell.point.x
        let dx2 = dx1 + width
        
        let cy = height + spaceY
        let dy1 = anchorPoint.y + anchorSpaceY - cy * anchorCell.point.y
        let dy2 = dy1 + height
        
        let intervalForCellX = ((point.x - dx2) / cx) ... ((point.x - dx1) / cx)
        let intervalForCellY = ((point.y - dy2) / cy) ... ((point.y - dy1) / cy)
        
        guard let integerValuesX = intervalForCellX.intValues,
            let integerValuesY = intervalForCellY.intValues else {
            return []
        }
        
        var result: [Cell] = []
        for x in integerValuesX {
            for y in integerValuesY {
                let cell = Cell(x: x, y: y)
                result.append(cell)
            }
        }
        
        return result
    }
    
}


private extension Grid4 {
    var anchorSpaceX: CGFloat {
        switch anchorMode {
        case .center: return -0.5 * width
        case .origin: return 0.0
        case .originWithSpace: return -0.5 * spaceX
        }
    }
    
    var anchorSpaceY: CGFloat {
        switch anchorMode {
        case .center: return -0.5 * height
        case .origin: return 0.0
        case .originWithSpace: return -0.5 * spaceY
        }
    }
}


extension Grid4 {
    public enum AnchorMode {
        /// Anchor cell is anchored to its center.
        case center
        
        /// Anchor cell is anchored to its origin.
        case origin
        
        /// The same as `origin` but also with respect to `spaceX` and `spaceY`
        case originWithSpace
    }
}


private extension IntervalType where Bound == CGFloat {
    
    /// Returns int values, containing in this closed `CGFloat` interval. If there are no such values, it returns `nil`.
    var intValues: Range<Int>? {
        let startValue = Int(ceil(self.start))
        let endValue = Int(floor(self.end))
        if startValue > endValue {
            return nil
        }
        return startValue...endValue
    }
}
