import Foundation

public extension CGSize {
    /// Returns a string that indicates the current
    /// width and height of this size structure.
    var intDescription: String {
        String(format: "(w: %3d, h: %3d)", self.width.intValue, self.height.intValue)
    }
}
