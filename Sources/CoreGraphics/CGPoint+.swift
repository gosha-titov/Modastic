#if canImport(CoreGraphics)

import CoreGraphics

public extension CGPoint {
    
    /// Returns a midpoint between two specified points.
    /// ## Example
    /// ```
    /// let point1 = CGPoint(x: 0, y: 30)
    /// let point2 = CGPoint(x: 40, y: 0)
    ///
    /// let point = CGPoint.midpoint(between: point1, and: point2)
    /// // CGPoint(x: 20, y: 15)
    /// ```
    @inlinable @inline(__always)
    static func midpoint(between point1: CGPoint, and point2: CGPoint) -> CGPoint {
        return CGPoint(x: (point1.x + point2.x) / 2, y: (point1.y + point2.y) / 2)
    }
    
    /// Returns a distance from this point to the specified one.
    /// ## Example
    /// ```
    /// let point1 = CGPoint(x: 0, y: 30)
    /// let point2 = CGPoint(x: 40, y: 0)
    ///
    /// let hypotenuse = point1.distance(to: point2)
    /// // 50
    /// ```
    @inlinable
    func distance(to point: CGPoint) -> CGFloat {
        let dy = abs(point.y - y)
        if point.x == x { return dy }
        let dx = abs(point.x - x)
        if point.y == y { return dx }
        return hypot(dx, dy)
    }
    
    
    // MARK: Methods
    
    /// Returns a new point offsetting the current X- and Y- positions by the specified values.
    /// ## Example
    /// ```
    /// // Modern way
    /// let newPoint = point.offsetBy(dx: 8, dy: 16)
    ///
    /// // Manual way
    /// let newPoint = CGPoint(
    ///     x: point.x + 8,
    ///     y: point.y + 16
    /// )
    /// ```
    @inlinable @inline(__always)
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x + dx, y: y + dy)
    }
    
    /// Returns a new point offsetting the current X- and Y- positions by the specified radius and angle of the circle centered on this point.
    /// ## Example
    /// ```
    /// let point = CGPoint(x: 100, y: 50)
    /// let newPoint = point.offsetBy(angle: .pi / 2, radius: 25)
    /// // CGPoint(x: 100, y: 75)
    ///
    /// ▲ y     .pi / 2
    /// ├      ╭───●───╮
    /// │      │   │   │
    /// ├  .pi ┤   ○╶─ ┼ 0
    /// │      │       │
    /// │      ╰───┬───╯
    /// │     .pi * 3 / 2
    /// │
    /// ┼──────────┴─────▶ x
    /// ```
    /// - Parameter angle: The angle in radians.
    @inlinable @inline(__always)
    func offsetBy(angle: CGFloat, radius: CGFloat) -> CGPoint {
        return offsetBy(
            dx: radius * cos(angle),
            dy: radius * sin(angle)
        )
    }
    
    /// Returns a new point offset by the specified distance towards another point.
    /// ## Example
    /// ```
    /// let point1 = CGPoint(x: 0, y: 30)
    /// let point2 = CGPoint(x: 40, y: 0)
    ///
    /// let point3 = point1.offset(by: 25, towards: point2)
    /// // CGPoint(x: 20, y: 15)
    /// ```
    @inlinable
    func offset(by offset: CGFloat, towards point: CGPoint) -> CGPoint {
        guard self != point, offset != 0 else { return self }
        if x == point.x {
            return withY(offsetBy: offset * (y < point.y ? +1 : -1))
        }
        if y == point.y {
            return withX(offsetBy: offset * (x < point.x ? +1 : -1))
        }
        let dx = point.x - x, dy = point.y - y
        let distance = hypot(dx, dy)
        let unit = CGPoint(x: dx / distance, y: dy / distance)
        return CGPoint(x: x + offset * unit.x, y: y + offset * unit.y)
    }
    
    
    /// Returns a boolean value that indicates whether this point lies on the line segment between two specified points.
    /// ## Example
    /// ```
    /// let point1 = CGPoint(x: 0, y: 30)
    /// let point2 = CGPoint(x: 40, y: 0)
    /// let point3 = CGPoint(x: 20, y: 15)
    ///
    /// point3.isBetween(point1, and: point2)
    /// // true
    /// ```
    @inlinable
    func isBetween(_ point1: CGPoint, and point2: CGPoint) -> Bool {
        guard min(point1.x, point2.x) <= x, x <= max(point1.x, point2.x),
              min(point1.y, point2.y) <= y, y <= max(point1.y, point2.y)
        else { return false }
        return isColinear(with: point1, and: point2)
    }
    
    /// Returns a boolean value that indicates whether this point and the other two lie on the same line.
    /// ## Example
    /// ```
    /// let point1 = CGPoint(x: 0, y: 30)
    /// let point2 = CGPoint(x: 40, y: 0)
    /// let point3 = CGPoint(x: 20, y: 15)
    ///
    /// point3.isColinear(with: point1, and: point2)
    /// // true
    /// ```
    @inlinable
    func isColinear(with point1: CGPoint, and point2: CGPoint) -> Bool {
        if point1.x == point2.x {
            return x == point1.x
        }
        if point1.y == point2.y {
            return y == point1.y
        }
        let tolerance = CGFloat(1e-12)
        let crossProduct = (point1.x - x) * (point2.y - y) - (point1.y - y) * (point2.x - x)
        return abs(crossProduct) < tolerance
    }
    
    
    /// Returns a new point replacing the current X-position with the specified one.
    /// ## Example
    /// ```
    /// // Modern way
    /// let newPoint = point.withX(newX)
    ///
    /// // Manual way
    /// let newPoint = CGPoint(
    ///     x: newX,
    ///     y: point.y
    /// )
    /// ```
    @inlinable @inline(__always)
    func withX(_ newX: CGFloat) -> CGPoint {
        return CGPoint(x: newX, y: y)
    }
    
    /// Returns a new point with the current X-position updated.
    /// ## Example
    /// ```
    /// // Modern way
    /// let newPoint = point.withX { $0 * 2 }
    ///
    /// // Manual way
    /// let newPoint = CGPoint(
    ///     x: point.x * 2,
    ///     y: point.y
    /// )
    /// ```
    @inlinable @inline(__always)
    func withX(update: (CGFloat) -> CGFloat) -> CGPoint {
        return withX(update(x))
    }
    
    /// Returns a new point offsetting the current X-position by the specified value.
    /// ## Example
    /// ```
    /// // Modern way
    /// let newPoint = point.withX(offsetBy: 16)
    ///
    /// // Manual way
    /// let newPoint = CGPoint(
    ///     x: point.x + 16,
    ///     y: point.y
    /// )
    /// ```
    @inlinable @inline(__always)
    func withX(offsetBy dx: CGFloat) -> CGPoint {
        return withX(x + dx)
    }
    
    /// Returns a new point replacing the current Y-position with the specified one.
    /// ## Example
    /// ```
    /// // Modern way
    /// let newPoint = point.withY(newY)
    ///
    /// // Manual way
    /// let newPoint = CGPoint(
    ///     x: point.x,
    ///     y: newY
    /// )
    /// ```
    @inlinable @inline(__always)
    func withY(_ newY: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: newY)
    }
    
    /// Returns a new point with the current Y-position updated.
    /// ## Example
    /// ```
    /// // Modern way
    /// let newPoint = point.withY { $0 * 2 }
    ///
    /// // Manual way
    /// let newPoint = CGPoint(
    ///     x: point.x,
    ///     y: point.y * 2
    /// )
    /// ```
    @inlinable @inline(__always)
    func withY(update: (CGFloat) -> CGFloat) -> CGPoint {
        return withY(update(y))
    }
    
    /// Returns a new point offsetting the current Y-position by the specified value.
    /// ## Example
    /// ```
    /// // Modern way
    /// let newPoint = point.withY(offsetBy: 16)
    ///
    /// // Manual way
    /// let newPoint = CGPoint(
    ///     x: point.x,
    ///     y: point.y + 16
    /// )
    /// ```
    @inlinable @inline(__always)
    func withY(offsetBy dy: CGFloat) -> CGPoint {
        return withY(y + dy)
    }
    
}

#endif
