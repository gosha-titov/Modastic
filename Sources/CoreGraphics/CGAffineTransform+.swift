#if canImport(CoreGraphics)

import CoreGraphics

public extension CGAffineTransform {
    
    /// Returns an affine transformation matrix constructed from a rotation value you provide.
    /// ## Example
    /// ```
    /// view.transform = .rotationBy(angle: .pi)
    ///
    /// // The same as
    /// view.transform = .init(rotationAngle: .pi)
    /// ```
    /// - Parameter angle: The angle, in radians, by which this matrix rotates the coordinate system axes.
    ///   In iOS, a positive value specifies counterclockwise rotation and a negative value specifies clockwise rotation.
    ///   In macOS, a positive value specifies clockwise rotation and a negative value specifies counterclockwise rotation.
    @inlinable @inline(__always)
    static func rotationBy(angle: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(rotationAngle: angle)
    }
    
    /// Returns an affine transformation matrix constructed from translation values you provide.
    /// ## Example
    /// ```
    /// view.transform = .translationBy(x: 16, y: 8)
    ///
    /// // The same as
    /// view.transform = .init(translationX: 16, y: 8)
    /// ```
    /// - Parameter tx: The value by which to move the x-axis of the coordinate system.
    /// - Parameter ty: The value by which to move the y-axis of the coordinate system.
    @inlinable @inline(__always)
    static func translationBy(x tx: CGFloat, y ty: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: tx, y: ty)
    }
    
    /// Returns an affine transformation matrix constructed from scaling values you provide.
    /// ## Example
    /// ```
    /// view.transform = .scaleBy(x: 1.25, y: 1.25)
    ///
    /// // The same as
    /// view.transform = .init(scaleX: 1.25, y: 1.25)
    /// ```
    /// - Parameter sx: The factor by which to scale the x-axis of the coordinate system.
    /// - Parameter sy: The factor by which to scale the y-axis of the coordinate system.
    @inlinable @inline(__always)
    static func scaleBy(x sx: CGFloat, y sy: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(scaleX: sx, y: sy)
    }
    
    
    // MARK: Inits
    
    /// Creates an affine transformation matrix constructed from the scaling value you provide.
    /// - Parameter scale: The factor by which to scale the x-axis and y-axis of the coordinate system.
    @inlinable @inline(__always)
    init(scale: CGFloat) {
        self.init(scaleX: scale, y: scale)
    }
    
}

#endif
