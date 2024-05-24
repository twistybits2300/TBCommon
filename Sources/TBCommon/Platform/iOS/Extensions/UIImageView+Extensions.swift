#if os(iOS)
import UIKit

@available(iOS 13.0, *)
public extension UIImageView {
    /// Initializes a new image view using the given image `name` and
    /// `backgroundColor`.
    /// - Parameters:
    ///   - name: The name of the image to be displayed.
    ///   - backgroundColor: The background color of the image.
    convenience init(named name: String, backgroundColor: UIColor) {
        self.init(image: UIImage(named: name))
        self.backgroundColor = backgroundColor
        useAutoLayout()
    }
}
#endif
