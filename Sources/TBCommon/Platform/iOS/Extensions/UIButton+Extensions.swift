#if os(iOS)
import UIKit

@available(iOS 15, *)
public extension UIButton {
    /// Utility function for creating a `UIButton` featuring dynamic type
    /// for the title font.  It uses `UIButton.Configuration` for the button's
    /// style.
    /// - Parameters:
    ///   - title: The button's title.
    ///   - tintColor: Its `.tintColor`
    ///   - textStyle: The dynamic type text style to be used.
    ///   Defaults to `.title3`.
    ///   - target: The button's action target.
    ///   - selector: The button's action selector function.
    /// - Returns: A newly created button.
    /// 
    /// If `titleFontSize` is non-`nil` the button's title is set
    /// using an `AttributedString` via `.attributedTitle`. Otherwise,
    /// the default font and size is used by setting the given `title`
    /// to the button's `title`.
    static func makeDynamicTypeButton(title: String,
                                      tintColor: UIColor,
                                      textStyle: UIFont.TextStyle = .title3,
                                      target: Any?,
                                      selector: Selector) -> UIButton {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.preferredFont(forTextStyle: textStyle)
        configuration.attributedTitle = AttributedString(title, attributes: container)
        
        let button = UIButton(configuration: configuration)
        button.useAutoLayout()
        button.tintColor = tintColor
        button.addTarget(target, action: selector, for: .touchUpInside)

        return button
    }
    
    /// Utility function for creating a `UIButton`. It uses `UIButton.Configuration`
    /// to customize the button.
    /// - Parameters:
    ///   - title: The button's title.
    ///   - tintColor: Its `.tintColor`
    ///   - titleFontSize: The size of the font used for the title.
    ///   Defaults to `nil`.
    ///   - target: The button's action target.
    ///   - selector: The button's action selector function.
    /// - Returns: A newly created button.
    ///
    /// If `titleFontSize` is non-`nil` the button's title is set
    /// using an `AttributedString` via `.attributedTitle`. Otherwise,
    /// the default font and size is used by setting the given `title`
    /// to the button's `title`.
    static func makeButton(title: String,
                           tintColor: UIColor,
                           titleFontSize: CGFloat? = nil,
                           target: Any?,
                           selector: Selector) -> UIButton {
        var configuration = UIButton.Configuration.filled()
        
        if let fontSize = titleFontSize {
            var container = AttributeContainer()
            container.font = UIFont.boldSystemFont(ofSize: fontSize)
            
            configuration.attributedTitle = AttributedString(title, attributes: container)
        } else {
            configuration.title = title
        }
        
        let button = UIButton(configuration: configuration)
        button.useAutoLayout()
        button.tintColor = tintColor
        button.addTarget(target, action: selector, for: .touchUpInside)

        return button
    }
    
    /// Utility function for making a `UIButton` with just an image icon
    /// that can be placed in a `UIView`-based toolbar (as opposed to a 
    /// `UIBarButtonItem` which can be placed in a toolbar, navigation bar 
    /// or shortcuts bar).
    /// - Parameters:
    ///   - iconName: The system name of the SF Fonts image to be used.
    ///   - action: The button's action to be performed when tapped.
    ///   - imageScale: The scale to use for the image icon.
    ///   Defaults to `.large`/
    /// - Returns: A newly created toolbar button.
    ///
    /// - `UIButton.Configuration` is used for customizing the button.
    /// - It assumes that auto layout will be used for the size and
    /// position of the button. If this is not what is desired, set
    /// `.translatesAutoresizingMaskIntoConstraints = true`.
    /// - It sets the button's `.contentInsets` to `16` on all edges.
    static func makeToolbarButton(iconName: String,
                                  imageScale: UIImage.SymbolScale = .large,
                                  action: UIAction) -> UIButton {
        var configuration = UIButton.Configuration.plain()
        let scaleConfiguration = UIImage.SymbolConfiguration(scale: imageScale)
        configuration.image = UIImage(systemName: iconName, withConfiguration: scaleConfiguration)
        configuration.contentInsets = insets
        
        let button = UIButton(configuration: configuration, primaryAction: action)
        button.useAutoLayout()
        return button
    }
    
    private static var insets: NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
    }
}
#endif
