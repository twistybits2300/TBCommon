#if os(iOS)
import UIKit

public extension NSDirectionalEdgeInsets {
    /// Utility initializer for creating directional edge insets
    /// in which `top`, `leading`, `bottom` and `trailing` all
    /// have the same value.
    /// - Parameter value: The value to set for all edge values.
    init(all value: CGFloat) {
        self.init(top: value, leading: value, bottom: value, trailing: value)
    }
}
#endif
