import Foundation

public extension String {
    /// Puts the contents of this string onto 
    /// the generally available clipboard.
    func putOnPasteboard() {
        Clipboard.general.paste(self)
    }
}
