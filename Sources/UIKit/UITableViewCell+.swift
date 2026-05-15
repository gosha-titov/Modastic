#if canImport(UIKit)

import UIKit

public extension UITableViewCell {
    
    /// A `String` value describing `self`.
    /// ## Example
    /// ```
    /// class SomeCell: UITableViewCell {}
    ///
    /// SomeCell.reuseIdentifier // "SomeCell"
    /// ```
    @inlinable @inline(__always)
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

#endif
