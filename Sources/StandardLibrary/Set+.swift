public extension Set {
    
    /// Creates a set that has no elements.
    @inlinable @inline(__always)
    static var empty: Self { [] }
    
    
    // MARK: Methods
    
    /// Finds, removes and returns the elements that satisfy the given predicate.
    /// ## Example
    /// ```
    /// var sourceNumbers: Set = [0, 1, 2, 3, 4, 5]
    /// let evenNumbers = sourceNumbers.extract { $0 % 2 == 0 }
    /// print(sourceNumbers) // [1, 3, 5]
    /// print(evenNumbers) // [0, 2, 4]
    /// ```
    @inlinable @inline(__always)
    mutating func extract(_ isExtracted: (Element) -> Bool) -> Self {
        let extractedElements = filter(isExtracted)
        subtract(extractedElements)
        return extractedElements
    }
    
    
    /// Inserts the specified elements in the set if they are not already present.
    /// ## Example
    /// ```
    /// var set: Set = [0, 1]
    /// set.insert(contentsOf: [2, 3]) // [0, 1, 2, 3]
    /// ```
    @inlinable @inline(__always)
    mutating func insert<S: Sequence>(contentsOf newElements: S) where S.Element == Element {
        self = union(newElements)
    }
    
    /// Returns a new set with the specified element inserted.
    ///  ## Example
    /// ```
    /// let set: Set = [0, 1]
    /// set.inserting(2) // [0, 1, 2]
    /// ```
    @inlinable @inline(__always)
    func inserting(_ newElement: Element) -> Self {
        return mutating(self) { $0.insert(newElement) }
    }
    
    /// Returns a new set with the specified elements inserted.
    /// ## Example
    /// ```
    /// let set: Set = [0, 1]
    /// set.inserting(contentsOf: [2, 3]) // [0, 1, 2, 3]
    /// ```
    @inlinable @inline(__always)
    func inserting<S: Sequence>(contentsOf newElements: S) -> Self where S.Element == Element {
        return union(newElements)
    }
    
    
    /// Removes the specified elements from the set.
    /// ## Example
    /// ```
    /// var set: Set = [0, 1, 2, 3]
    /// set.remove(contentsOf: [2, 3]) // [0, 1]
    /// ```
    @inlinable @inline(__always)
    mutating func remove<S: Sequence>(contentsOf oldElements: S) where S.Element == Element {
        self = subtracting(oldElements)
    }
    
    /// Removes elements that do not satisfy the given predicate.
    /// ## Example
    /// ```
    /// var set: Set = [0, 1, 2, 3]
    /// set.remove(where: { $0 % 2 == 0 }) // [1, 3]
    /// ```
    @inlinable @inline(__always)
    mutating func remove(where isRemoved: (Element) throws -> Bool) rethrows {
        return self = try removing(where: isRemoved)
    }
    
    /// Returns a new set with the specified element removed.
    /// ## Example
    /// ```
    /// let set: Set = [0, 1, 2, 3]
    /// set.removing(2) // Prints [0, 1, 3]
    /// ```
    @inlinable @inline(__always)
    func removing(_ oldElement: Element) -> Self {
        return mutating(self) { $0.remove(oldElement) }
    }
    
    /// Returns a new set containing the elements except for those that do not satisfy the given predicate.
    /// ## Example
    /// ```
    /// let set: Set = [0, 1, 2, 3]
    /// set.removing(where: { $0 % 2 == 0 }) // [1, 3]
    /// ```
    @inlinable @inline(__always)
    func removing(where isRemoved: (Element) throws -> Bool) rethrows -> Self {
        return try filter { try !isRemoved($0) }
    }
    
    /// Returns a new set with the specified elements removed.
    /// ## Example
    /// ```
    /// let set: Set = [0, 1, 2, 3]
    /// set.removing(contentsOf: [2, 3]) // [0, 1]
    /// ```
    @inlinable @inline(__always)
    func removing<S: Sequence>(contentsOf oldElements: S) -> Self where S.Element == Element {
        return subtracting(oldElements)
    }
    
}
