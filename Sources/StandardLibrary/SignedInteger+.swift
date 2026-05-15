public extension SignedInteger {

    /// An array containing the digits of this integer.
    /// ## Example
    /// ```
    /// let number = -312
    /// number.digits // [3, 1, 2]
    /// ```
    @inlinable @inline(__always)
    var digits: [Int] {
        return String(abs).compactMap { $0.toInt() }
    }
    
}
