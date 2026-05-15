/// Returns a copy of the given value after applying a set of mutating changes.
///
/// Use this function when you want to perform mutating operations on a copy of a constant value.
/// ## Example
/// ```
/// let array = [1, 2, 3]
/// let mutatedArray = mutating(array) {
///     $0.append(4)
/// }
/// print(mutatedArray) // [1, 2, 3, 4]
/// ```
@usableFromInline @inline(__always)
internal func mutating<V>(_ value: V, mutate: (inout V) -> Void) -> V {
    var value = value
    mutate(&value)
    return value
}
