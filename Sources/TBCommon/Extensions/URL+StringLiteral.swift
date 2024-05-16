import Foundation

public extension URL {
    /// Utility for creating a `URL` given a `text` string.
    /// - Parameters:
    ///   - text: The text to be converted into a `URL`
    ///
    /// ⚠️ WARNING - USE THIS WITH CAUTION ⚠️
    ///
    /// A `preconditionFailure()` will be triggered if the
    /// conversion of the given `text` into a `URL` fails.
    init(stringLiteral text: String, file: StaticString = #file, line: UInt = #line) {
        guard let url = URL(string: text) else {
            preconditionFailure("URL not created - invalid `stringLiteral`: \(text)", file: file, line: line)
        }
        self = url
    }
    
    /// Puts the contents of this `URL` onto
    /// the generally available clipboard.
    func putOnPasteboard() {
        absoluteString.putOnPasteboard()
    }
}
