import XCTest
import os.log
@testable import TBCommon

/// Validation of `URL+StringLiteral`.
final class URL_StringLiteralTests: XCTestCase {
    /// Validates that `init(stringLiteral:)` works as expected.
    func testInitStringLiteral() throws {
        let text = "https://www.apple.com"
        let expected = try XCTUnwrap(URL(string: text))
        let result = URL(stringLiteral: text)
        XCTAssertEqual(result, expected)
    }
}

