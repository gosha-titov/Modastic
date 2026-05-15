public extension SignedNumeric where Self: Comparable {
    
    /// The absolute value of this  number.
    /// ## Example
    /// ```
    /// let number = -19
    /// number.abs // 19
    /// ```
    @inlinable @inline(__always)
    var abs: Self {
        return Swift.abs(self)
    }
    
}
