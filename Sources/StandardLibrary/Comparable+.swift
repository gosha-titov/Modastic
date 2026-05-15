public extension Comparable {
    
    /// Returns an instance value clamped to the given limiting range.
    /// ## Example
    /// ```
    /// let limits = 5...8
    /// 3.clamped(to: limits) // 5
    /// 7.clamped(to: limits) // 7
    /// 9.clamped(to: limits) // 8
    /// ```
    @inlinable @inline(__always)
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return max(limits.lowerBound, min(self, limits.upperBound))
    }
    
    /// Returns an instance value clamped to the given limiting range.
    /// ## Example
    /// ```
    /// let limits = 5...
    /// 3.clamped(to: limits) // 5
    /// 7.clamped(to: limits) // 7
    /// ```
    @inlinable @inline(__always)
    func clamped(to limits: PartialRangeFrom<Self>) -> Self {
        if self < limits.lowerBound { return limits.lowerBound }
        return self
    }
    
    /// Returns an instance value clamped to the given limiting range.
    /// ## Example
    /// ```
    /// let limits = ...5
    /// 3.clamped(to: limits) // 3
    /// 7.clamped(to: limits) // 5
    /// ```
    @inlinable @inline(__always)
    func clamped(to limits: PartialRangeThrough<Self>) -> Self {
        if self > limits.upperBound { return limits.upperBound }
        return self
    }
    
    
    /// Clamps the instance value to the given limiting range.
    /// ## Example
    /// ```
    /// let limits = 5...8
    ///
    /// var number = 3
    /// number.clamp(to: limits) // 5
    ///
    /// number = 7
    /// number.clamp(to: limits) // 7
    ///
    /// number = 9
    /// number.clamp(to: limits) // 8
    /// ```
    @inlinable @inline(__always)
    mutating func clamp(to limits: ClosedRange<Self>) {
        self = clamped(to: limits)
    }
    
    /// Clamps the instance value to the given limiting range.
    /// ## Example
    /// ```
    /// let limits = 5...
    ///
    /// var number = 3
    /// number.clamp(to: limits) // 5
    ///
    /// number = 7
    /// number.clamp(to: limits) // 7
    /// ```
    @inlinable @inline(__always)
    mutating func clamp(to limits: PartialRangeFrom<Self>) {
        self = clamped(to: limits)
    }
    
    /// Clamps the instance value to the given limiting range.
    /// ## Example
    /// ```
    /// let limits = ...5
    ///
    /// var number = 3
    /// number.clamp(to: limits) // 3
    ///
    /// number = 7
    /// number.clamp(to: limits) // 5
    /// ```
    @inlinable @inline(__always)
    mutating func clamp(to limits: PartialRangeThrough<Self>) {
        self = clamped(to: limits)
    }
    
}
