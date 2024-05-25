#if os(iOS)
import UIKit

@available(iOS 13.0, *)
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
    
    /// Adds a new view of the given `color` and `radius` to the background
    /// of this stack view.
    /// - Parameters:
    ///   - color: The new view's background color.
    ///   - radius: The new view's corner radius.
    /// - Returns: The newly created view. Can be discarded.
    @discardableResult
    func addBackgroundView(color: UIColor, radius: CGFloat = 0) -> UIView {
        addChildView(color: color, radius: radius)
    }
    
    /// Adds a new view of the given `color` and `radius` to the foreground
    /// of this stack view.
    /// - Parameters:
    ///   - color: The new view's background color.
    ///   - radius: The new view's corner radius.
    /// - Returns: The newly created view. Can be discarded.
    @discardableResult
    func addForegroundView(color: UIColor, radius: CGFloat = 0) -> UIView {
        let index = subviews.count
        return addChildView(color: color, radius: radius, at: index)
    }

    /// Adds a new view whose background color is set to `color`,
    /// corner radius is set to `radius` at the given subview `index`.
    /// - Parameters:
    ///   - color: The new view's background color.
    ///   - radius: The new view's corner radius.
    ///   - index: The subview index to insert the new view at.
    /// - Returns: A new view. Can be discarded.
    @discardableResult
    func addChildView(color: UIColor,
                      radius: CGFloat = 0,
                      at index: Int = 0) -> UIView {
        let view = UIView()
        view.useAutoLayout()
        view.backgroundColor = color
        view.layer.cornerRadius = radius
        insertSubview(view, at: index)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        return view
    }

    // MARK: - Utilities
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
