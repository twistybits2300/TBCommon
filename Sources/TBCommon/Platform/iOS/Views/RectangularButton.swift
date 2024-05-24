#if os(iOS)
import UIKit

/// Button styled as a rectangle with a colored background,
/// using a large font for the title text.
@available(iOS 15.0, *)
public final class RectangularButton: UIButton {
    /// The button's styling information.
    public let style: Style
    
    // MARK: - Initialization
    /// Initializes using the given `title` and `style`.
    /// - Parameters:
    ///   - title: The button's title text.
    ///   - style: The styling of the button.
    public init(title: String, style: Style = .defaultStyle) {
        self.style = style
        super.init(frame: .zero)
        configureView(title: title)
    }
    
    public override init(frame: CGRect) {
        self.style = .defaultStyle
        super.init(frame: frame)
        configureView(title: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.style = .defaultStyle
        super.init(coder: aDecoder)
        configureView(title: nil)
    }
    
    // MARK: - Configuration
    private func configureView(title: String?) {
        var buttonTitle: String
        
        if let title = title {
            buttonTitle = title
        } else {
            buttonTitle = self.configuration?.title ?? ""
        }
        
        var configuration = UIButton.Configuration.filled()

        self.tintColor = style.backgroundColor
        configuration.baseForegroundColor = style.textColor

        var container = AttributeContainer()
        container.font = UIFont.preferredFont(forTextStyle: style.textStyle)
        configuration.attributedTitle = AttributedString(buttonTitle, attributes: container)

        self.configuration = configuration
    }
}

// MARK: - RectangularButton.Style
@available(iOS 15.0, *)
public extension RectangularButton {
    /// Information about the button's styling.
    struct Style {
        /// The button's background color.
        public let backgroundColor: UIColor
        
        /// The dynamic type text style to be used.
        public let textStyle: UIFont.TextStyle
        
        /// The color to use for displaying the title text.
        public let textColor: UIColor
    }
}

@available(iOS 15.0, *)
public extension RectangularButton.Style {
    /// A default style for a `RectangularButton`.
    static var defaultStyle: RectangularButton.Style {
        RectangularButton.Style(backgroundColor: .systemGreen,
                                textStyle: .title3,
                                textColor: UIColor.label)
    }
}

// MARK: - Preview
@available(iOS 17, *)
#Preview {
    RectangularButton(title: "Button")
}
#endif
