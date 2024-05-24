#if os(iOS)
import UIKit

public extension UITraitCollection {
    /// String that displays what the current
    /// horizontal and vertical size classes are.
    var sizeClasses: String {
        String("h: \(horizontalSizeClass) | v: \(verticalSizeClass)")
    }
}
#endif
