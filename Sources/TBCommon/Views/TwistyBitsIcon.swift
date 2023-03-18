import SwiftUI

/// The twistybits icon view.
@available(macOS 11.0, *, iOS 13.0, *)
public struct TwistyBitsIcon: View {
    /// The size of the individual icons.
    let iconSize: CGFloat

    /// Spacing between the icons.
    let itemSpacing: CGFloat

    /// The color to use for the background behind the images.
    let backgroundColor: Color

    /// Initializes using the provided `iconSize` and `itemSpacing`.
    /// - Parameters:
    ///   - iconSize: The size of the individual icons. Defaults to `50`.
    ///   - itemSpacing: The spacing between the icons. Defaults to `10`.
    ///   - backgroundColor: The color to use for the background behind the images. Defaults to `.clear`.
    public init(iconSize: CGFloat = 50, itemSpacing: CGFloat = 10, backgroundColor: Color = .clear) {
        self.iconSize = iconSize
        self.itemSpacing = itemSpacing
        self.backgroundColor = backgroundColor
    }

    public var body: some View {
        HStack(spacing: itemSpacing) {
            Image(imageKey: Images.creatorIconLeft)
                .resizable()
                .frame(maxWidth: iconSize, maxHeight: iconSize)
            Image(imageKey: Images.creatorIconRight)
                .resizable()
                .frame(maxWidth: iconSize, maxHeight: iconSize)
        }
        .background(backgroundColor)
        .contentShape(Rectangle())
    }
}
