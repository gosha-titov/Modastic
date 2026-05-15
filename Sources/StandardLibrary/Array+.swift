public extension Array {
    
    /// Creates an array that has no elements.
    @inlinable @inline(__always)
    static var empty: Self { [] }
    
    
    // MARK: Methods
    
    /// Finds, removes and returns the elements that satisfy the given predicate, the order is preserved from the original array.
    /// ## Example
    /// ```
    /// var numbers = [0, 1, 2, 3, 4, 5]
    /// let evenNumbers = numbers.extract { $0 % 2 == 0 }
    /// print(numbers)     // [1, 3, 5]
    /// print(evenNumbers) // [0, 2, 4]
    /// ```
    /// - Parameter shouldBeExtracted: A closure that takes an element and returns a Boolean
    ///   value indicating whether the element should be extracted.
    /// - Returns: An array of the extracted elements.
    @inlinable @inline(__always)
    mutating func extract(_ shouldBeExtracted: (Element) -> Bool) -> Self {
        let extractedElements = filter(shouldBeExtracted)
        removeAll(where: shouldBeExtracted)
        return extractedElements
    }
    
    
    /// Rearranges an element from one specific position to another.
    /// ## Example
    /// ```
    /// var array = ["a", "b", "c", "d"]
    /// array.rearrange(from: 3, to: 1) // ["a", "d", "b", "c"]
    /// ```
    @inlinable @inline(__always)
    mutating func rearrange(from indexToRemove: Index, to indexToInsert: Index) {
        let element = remove(at: indexToRemove)
        insert(element, at: indexToInsert)
    }
    
    /// Returns a new array containing all elements but an element was rearranged from one specific position to another.
    /// ## Example
    /// ```
    /// let array = ["a", "b", "c", "d"]
    /// array.rearranging(from: 3, to: 1) // ["a", "d", "b", "c"]
    /// ```
    @inlinable @inline(__always)
    func rearranging(from indexToRemove: Index, to indexToInsert: Index) -> Self {
        return mutating(self) { $0.rearrange(from: indexToRemove, to: indexToInsert) }
    }
    
    
    /// Returns a new array with the specified element added to the end of the array.
    /// ## Example
    /// ```
    /// let array = [0, 1]
    /// array.appending(2) // [0, 1, 2]
    /// ```
    @inlinable @inline(__always)
    func appending(_ newElement: Element) -> Self {
        return mutating(self) { $0.append(newElement) }
    }
    
    /// Returns a new array with the elements of the specified sequence added to the end of the array.
    /// ## Example
    /// ```
    /// let array = [0, 1]
    /// array.appending(contentsOf: [2, 3]) // [0, 1, 2, 3]
    /// ```
    @inlinable @inline(__always)
    func appending<S: Sequence>(contentsOf newElements: S) -> Self where S.Element == Element {
        return mutating(self) { $0.append(contentsOf: newElements) }
    }
    
    
    /// Adds a new element at the beginning of the array.
    /// ## Example
    /// ```
    /// var array = [1, 2, 3]
    /// array.prepend(0) // [0, 1, 2, 3]
    /// ```
    @inlinable @inline(__always)
    mutating func prepend(_ newElement: Element) {
        insert(newElement, at: startIndex)
    }
    
    /// Adds the elements of a sequence at the beginning of the array.
    /// ## Example
    /// ```
    /// var array = [2, 3]
    /// array.prepend(contentsOf: [0, 1]) // [0, 1, 2, 3]
    /// ```
    @inlinable @inline(__always)
    mutating func prepend<C: Collection>(contentsOf newElements: C) where C.Element == Element {
        insert(contentsOf: newElements, at: startIndex)
    }
    
    /// Returns a new array with the specified element added at the beginning of the array.
    /// ## Example
    /// ```
    /// var array = [1, 2, 3]
    /// array.prepend(0) // [0, 1, 2, 3]
    /// ```
    @inlinable @inline(__always)
    func prepending(_ newElement: Element) -> Self {
        return mutating(self) { $0.prepend(newElement) }
    }
    
    /// Returns a new array with the specified elements of a sequence added at the beginning of the array.
    /// ## Example
    /// ```
    /// let array = [2, 3]
    /// array.prepending(contentsOf: [0, 1]) // [0, 1, 2, 3]
    /// ```
    @inlinable @inline(__always)
    func prepending<C: Collection>(contentsOf newElements: C) -> Self where C.Element == Element {
        return mutating(self) { $0.prepend(contentsOf: newElements) }
    }
    
    
    /// Returns a new array with an element at the specified index updated to a new one.
    /// ## Example
    /// ```
    /// let array = ["a", "b", "c"]
    /// array.setting("m", at: 1) // ["a", "m", "c"]
    /// ```
    @inlinable @inline(__always)
    func setting(_ newElement: Element, at index: Index) -> Self {
        return mutating(self) { $0[index] = newElement }
    }
    
    
    /// Removes elements that do not satisfy the given predicate.
    /// ## Example
    /// ```
    /// var array = [0, 1, 2, 3]
    /// array.remove(where: { $0 % 2 == 0 }) // [1, 3]
    /// ```
    @inlinable @inline(__always)
    mutating func remove(where isRemoved: (Element) throws -> Bool) rethrows {
        self = try removing(where: isRemoved)
    }
    
    /// Returns a new array containing the elements except for those that do not satisfy the given predicate.
    /// ## Example
    /// ```
    /// let array = [0, 1, 2, 3]
    /// array.removing(where: { $0 % 2 == 0 }) // [1, 3]
    /// ```
    @inlinable @inline(__always)
    func removing(where isRemoved: (Element) throws -> Bool) rethrows -> Self {
        return try filter { try !isRemoved($0) }
    }
    
}


public extension Array where Element: Equatable {
    
    /// Removes all the elements equal to the specified one from the array.
    /// ## Example
    /// ```
    /// var array = [1, 2, 3, 2, 4]
    /// array.remove(2) // [1, 3, 4]
    /// ```
    @inlinable @inline(__always)
    mutating func remove(_ oldElement: Element) {
        removeAll(where: { $0 == oldElement })
    }
    
    /// Removes all the specified elements from the array.
    /// ## Example
    /// ```
    /// var array = [1, 2, 3, 2, 4]
    /// array.remove(contentsOf: [2, 4]) // [1, 3]
    /// ```
    @inlinable @inline(__always)
    mutating func remove<S: Sequence>(contentsOf oldElements: S) where S.Element == Element {
        removeAll(where: { oldElements.contains($0) })
    }
    
    /// Returns a new array containing all but the specified element.
    /// ## Example
    /// ```
    /// let array = [1, 2, 3, 2, 4]
    /// array.removing(2) // [1, 3, 4]
    /// ```
    @inlinable @inline(__always)
    func removing(_ oldElement: Element) -> Self {
        return mutating(self) { $0.remove(oldElement) }
    }
    
    /// Returns a new array containing all but the specified elements.
    /// ## Example
    /// ```
    /// let array = [1, 2, 3, 2, 4]
    /// array.removing(contentsOf: [2, 4]) // [1, 3]
    /// ```
    @inlinable @inline(__always)
    func removing<S: Sequence>(contentsOf oldElements: S) -> Self where S.Element == Element {
        return mutating(self) { $0.remove(contentsOf: oldElements) }
    }
    
    
    /// Returns a new array containing all but duplicates, leaving only the first element of them.
    /// ## Example
    /// ```
    /// let array = [1, 2, 3, 2, 4, 4, 5, 4]
    /// array.removingDuplicates() // [1, 2, 3, 4, 5]
    /// ```
    @inlinable @inline(__always)
    func removingDuplicates() -> Self {
        return reduce(into: .empty) { result, element in
            if result.contains(element) == false {
                result.append(element)
            }
        }
    }
    
    /// Removes all duplicate elements, leaving only the first element of them.
    /// ## Example
    /// ```
    /// var array = [1, 2, 3, 2, 4, 4, 5, 4]
    /// array.removeDuplicates() // [1, 2, 3, 4, 5]
    /// ```
    @inlinable @inline(__always)
    mutating func removeDuplicates() {
        self = removingDuplicates()
    }
    
    
    /// Returns a boolean value that indicates whether the sequence contains all the given elements.
    /// ## Example
    /// ```
    /// let array = [3, 1, 4, 1, 5]
    /// array.contains(contentsOf: [5, 4, 6]) // false
    /// array.contains(contentsOf: [5, 4])    // true
    /// ```
    /// - Parameter elements: The elements to find in the sequence.
    /// - Returns: `True` if all elements were found in the sequence; otherwise, `false`.
    @inlinable @inline(__always)
    func contains<S: Sequence>(contentsOf elements: S) -> Bool where S.Element == Element {
        return elements.allSatisfy { contains($0) }
    }
    
}
