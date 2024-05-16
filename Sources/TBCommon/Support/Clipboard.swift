import Foundation

#if canImport(UIKit)
import UIKit
public typealias NativePasteboard = UIPasteboard

#elseif canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
public typealias NativePasteboard = NSPasteboard
#endif

/// Cross-platform wrapper around the native pasteboard implementation.
public struct Clipboard {
    /// The shared, general purpose clipboard
    public static let general = Clipboard()

    /// The pasteboard native to this device.
    public let native: NativePasteboard

    /// Initializes using the provided `native` pasteboard.
    /// - Parameter native: The native pasteboard being wrapped.
    public init(native: NativePasteboard = .general) {
        self.native = native
    }
}

#if canImport(UIKit)
extension Clipboard {
    /// Pastes the provided `text` onto the clipboard.
    /// - Parameter text: The text to be pasted.
    public func paste(_ text: String?) {
        native.string = text
    }

    /// Returns the text currently available from the clipboard; may be `nil`.
    public var currentText: String? {
        native.string
    }
}

#elseif canImport(AppKit) && !targetEnvironment(macCatalyst)
extension Clipboard {
    /// Pastes the provided `text` onto the clipboard.
    /// - Parameter text: The text to be pasted.
    public func paste(_ text: String?) {
        guard let text = text else { return }

        native.declareTypes([.string], owner: nil)
        native.setString(text, forType: .string)
    }

    /// Returns the text currently available from the clipboard; may be `nil`.
    public var currentText: String? {
        native.string(forType: .string)
    }
}
#endif
