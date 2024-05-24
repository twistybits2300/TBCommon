#if os(iOS)
import UIKit

@available(iOS 13.0, *)
public extension UILabel {
    /// Makes a label whose text can be displayed across multiple lines if needed.
    /// - Parameters:
    ///   - text: The text to be displayed.
    ///   - font: The font to be used. Defaults to a system font of size `12`.
    ///   - usesAutolayout: `true` indicates auto layout constraints will be
    ///   used for positioning and sizing the label; `false` means autoresizing
    ///   mask will be used. Defaults to `true`.
    /// - Returns: A newly created label.
    static func makeMultilineLabel(text: String,
                                   font: UIFont = UIFont.systemFont(ofSize: 12),
                                   usesAutolayout: Bool = true) -> UILabel {
        let label = UILabel()
        label.useAutoLayout()
        label.text = text
        label.font = font
        label.numberOfLines = 0
        return label
    }
}
#endif
