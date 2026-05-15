#if canImport(UIKit)

import UIKit

public extension UIView.AnimationOptions {
    
    /// Creates an animation options structure with the specified curve.
    @inlinable
    init(curve: UIView.AnimationCurve) {
        self = switch curve {
        case .easeInOut: .curveEaseInOut
        case .easeIn: .curveEaseIn
        case .easeOut: .curveEaseOut
        case .linear: .curveLinear
        @unknown default: .empty
        }
    }
    
}


public extension UIView.KeyframeAnimationOptions {
    
    /// An ease-in ease-out curve causes the animation to begin slowly,
    /// accelerate through the middle of its duration, and then slow again before completing.
    @inlinable @inline(__always)
    static var curveEaseInOut: UIView.KeyframeAnimationOptions {
        return Self(rawValue: UIView.AnimationOptions.curveEaseInOut.rawValue)
    }
    
    /// An ease-in curve causes the animation to begin slowly, and then speed up as it progresses.
    @inlinable @inline(__always)
    static var curveEaseIn: UIView.KeyframeAnimationOptions {
        return Self(rawValue: UIView.AnimationOptions.curveEaseIn.rawValue)
    }

    /// An ease-out curve causes the animation to begin quickly, and then slow as it completes.
    @inlinable @inline(__always)
    static var curveEaseOut: UIView.KeyframeAnimationOptions {
        return Self(rawValue: UIView.AnimationOptions.curveEaseOut.rawValue)
    }
    
    /// A linear animation curve causes the animation to occur evenly over its duration.
    @inlinable @inline(__always)
    static var curveLinear: UIView.KeyframeAnimationOptions {
        return Self(rawValue: UIView.AnimationOptions.curveLinear.rawValue)
    }
    
    
    // MARK: Init
    
    /// Creates an animation options structure with the specified curve.
    @inlinable
    init(curve: UIView.AnimationCurve) {
        self = switch curve {
        case .easeInOut: .curveEaseInOut
        case .easeIn: .curveEaseIn
        case .easeOut: .curveEaseOut
        case .linear: .curveLinear
        @unknown default: .empty
        }
    }
    
}

#endif
