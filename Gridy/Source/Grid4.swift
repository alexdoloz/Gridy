import Foundation
import CoreGraphics


/** Defines infinite rectangle grid, consisting of cells which have integer coordinates. First you assign parameters to it (`width`, `space`, etc.), then you use various methods (i.e. `rectForCell(_:)`) which perform all the necessary math.*/
public struct Grid4 {
    
// MARK: Properties
    
    /// Width of the cell; must be >= 0; default is 1.0
    public var width: CGFloat = 1.0 {
        didSet {
            precondition(width >= 0)
        }
    }
    
    /// Height of the cell; must be >= 0; default is 1.0
    public var height: CGFloat = 1.0 {
        didSet {
            precondition(height >= 0)
        }
    }
    
    /// Horizontal space between cells. By default there is no space (0.0).
    public var spaceX: CGFloat = 0.0
    
    /// Vertical space between cells. By default there is no space (0.0).
    public var spaceY: CGFloat = 0.0
    
    
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
    
}
