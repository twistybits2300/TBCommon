#if os(iOS)
import UIKit

public extension UIStackView {
    /// Creates a horizontal stack using the given subviews
    /// - Parameters:
    ///   - subviews: The subviews to be included in the stack.
    ///   - distribution: The stack's distribution. Defaults to `.fill`.
    ///   - alignment: The stack's alignment. Defaults to `.fill`
    ///   - spacing: The spacing between views in the stack.
    ///   Defaults to `UIStackView.spacingUseSystem`.
    /// - Returns: A newly created horizontal stack view.
    static func horizontalStack(subviews: [UIView],
                                distribution: UIStackView.Distribution = .fill,
                                alignment: UIStackView.Alignment = .fill,
                                spacing: CGFloat = UIStackView.spacingUseSystem) -> UIStackView {
        let stack = makeStack(subviews: subviews,
                              distribution: distribution,
                              alignment: alignment,
                              spacing: spacing)
        stack.axis = .horizontal
        return stack
    }
    
    /// Creates a vertical stack using the given subviews
    /// - Parameters:
    ///   - subviews: The subviews to be included in the stack.
    ///   - distribution: The stack's distribution. Defaults to `.fill`.
    ///   - alignment: The stack's alignment. Defaults to `.fill`
    ///   - spacing: The spacing between views in the stack.
    ///   Defaults to `UIStackView.spacingUseSystem`.
    /// - Returns: A newly created vertical stack view.
    static func verticalStack(subviews: [UIView],
                              distribution: UIStackView.Distribution = .fill,
                              alignment: UIStackView.Alignment = .fill,
                              spacing: CGFloat = UIStackView.spacingUseSystem) -> UIStackView {
        let stack = makeStack(subviews: subviews,
                              distribution: distribution,
                              alignment: alignment,
                              spacing: spacing)
        stack.axis = .vertical
        return stack
    }
    
    private static func makeStack(subviews: [UIView],
                           distribution: UIStackView.Distribution = .fill,
                           alignment: UIStackView.Alignment = .fill,
                           spacing: CGFloat = UIStackView.spacingUseSystem) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.axis = .vertical
        stack.distribution = distribution
        stack.alignment = alignment
        stack.spacing = spacing
        return stack
    }
}
#endif
