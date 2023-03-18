import SwiftUI
import os

@available(macOS 11.0, *, iOS 14.0, *)
extension View {
    /// Returns a logger to be used from within a view.
    public var log: Logger {
        Logger.ui
    }

    /// Provides a means of setting both the `width` and `height` of this view to the given `value`.
    /// - Parameters:
    ///   - value: The value to apply to `width` and `height`.
    ///   - alignment: The alignment of this view inside the resulting frame. Defaults to `.center`.
    public func frame(square value: CGFloat, alignment: Alignment = .center) -> some View {
        frame(width: value, height: value, alignment: alignment)
    }

    /// Prints the given message to the console.
    /// - Parameter message: The message to be logged.
    public func debug(_ message: String) -> Self {
        os_log("%@", type: .debug, message)
        return self
    }

    /// Makes the `View` not even part of the view hierarchy when passed a value of `true`
    /// - Parameter isGone: `true` means the view will not be in the view hierarchy;
    /// `false` means the view is in the hierarchy and will be visible.
    @ViewBuilder public func gone(_ isGone: Bool) -> some View {
        if !isGone {
            self
        } else {
            EmptyView()
        }
    }
}
