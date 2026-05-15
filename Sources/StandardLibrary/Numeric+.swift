public extension Numeric {
    
    /// Returns the result of multiplying this value by the given value.
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
    /// ````
    @inlinable @inline(__always)
    func multiplied(by multiplier: Self) -> Self {
        return self * multiplier
    }
    
    /// Returns the value of this instance raised to the given power.
    /// ## Example
    /// ```
    /// (-11).raised(to: 3) // -1331
    /// (2.5).raised(to: 2) // 6.25
    /// ```
    @inlinable
    func raised(to exponent: Int) -> Self {
        guard exponent > 0 else { return 1 }
        var result: Self = 1
        var base = self
        var exponent = exponent
        while exponent > 0 {
            if exponent & 1 == 1 {
                result *= base
            }
            base *= base
            exponent >>= 1
        }
        return result
    }
    
    /// Raises the value of this instance to the given power.
    /// ## Example
    /// ```
    /// var i = 12
    /// i.raise(to: 2) // 144
    ///
    /// var d = 1.5
    /// d.raise(to: 3) // 3.375
    /// ```
    @inlinable @inline(__always)
    mutating func raise(to exponent: Int) {
        self = raised(to: exponent)
    }
    
}
