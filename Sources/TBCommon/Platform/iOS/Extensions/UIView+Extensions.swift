#if os(iOS)
import UIKit

@available(iOS 13.0, *)
public extension UIView {
    /// Makes a view of the given background `color` and that can be configured to use auto layout.
    /// - Parameters:
    ///   - color: The color to use for the view's background.
    /// Defaults to `.systemBackground` color.
    ///   - usesAutolayout: `true` indicates the view will use auto layout constraints to position
    ///   and size the view; `false` means it'll use auto masking for that. Defaults to `true`.
    /// - Returns: The newly created view.
    static func makeView(color: UIColor = .systemBackground, usesAutolayout: Bool = true) -> UIView {
        let view = UIView()
        
        view.backgroundColor = color
        if usesAutolayout {
            view.useAutoLayout()
        }
        
        return view
    }
    
    /// Indicates this view will use auto layout constraints to position and size it in the superview.
    func useAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
#endif
