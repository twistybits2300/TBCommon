import Foundation

public extension URL {
    init(stringLiteral text: String, file: StaticString = #file, line: UInt = #line) {
        guard let url = URL(string: text) else {
            preconditionFailure("URL not created - invalid `stringLiteral`: \(text)", file: file, line: line)
        }
        self = url
    }

    func putOnPasteboard() {
        absoluteString.putOnPasteboard()
    }
}
