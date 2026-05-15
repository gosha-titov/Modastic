public extension FloatingPoint {
    
    /// A value converted from the value of this instance in degrees to a value in radians.
    /// ## Example
    /// ```
    /// let angle = 120.0
    /// angle.degreesToRadians // 2.094...
    /// ```
    @inlinable @inline(__always)
    var degreesToRadians: Self {
        return self * .pi / 180
    }
    
    /// A value converted from the value of this instance in radians to a value in degrees.
    /// ## Example
    /// ```
    /// let angle = 2.0
    /// angle.radiansToDegrees // 114.5...
    /// ```
    @inlinable @inline(__always)
    var radiansToDegrees: Self {
        return self * 180 / .pi
    }
    
    
    // MARK: Methods
    
    /// Returns the result of dividing this value by the given value.
    /// ## Example
    /// ```
    /// // Getting a percentage rounded to the nearest 5% stride
    /// let percentage = rawPercentage
    ///     .toDouble()
    ///     .divided(by: 5)
    ///     .rounded()
    ///     .toInt()
    ///     .multiplied(by: 5)
    ///     .clamped(to: 0...100)
    /// ```
    @inlinable @inline(__always)
    func divided(by divisor: Self) -> Self {
        return self / divisor
    }
    
    /// Returns this value rounded to the specified decimal places using the specified rounding rule.
    /// ## Example
    /// ```
    /// let pi = 3.14159
    ///
    /// print(pi.rounded(toDecimalPlaces: 3, rule: .toNearestOrAwayFromZero))
    /// // Prints "3.142"
    ///
    /// print(pi.rounded(toDecimalPlaces: 3, rule: .up)
    /// // Prints "3.142"
    ///
    /// print(pi.rounded(toDecimalPlaces: 3, rule: .down)
    /// // Prints "3.141"
    /// ```
    @inlinable
    func rounded(toDecimalPlaces number: Int, rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Self {
        guard isFinite else { return self }
        let factor = Self(10.raised(to: number))
        return (self * factor).rounded(rule) / factor
    }
    
}
