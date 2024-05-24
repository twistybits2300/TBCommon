import XCTest
import os
@testable import TBCommon

/// Validation of `UILabel+Extensions`.
final class UILabel_ExtensionsTests: XCTestCase {
    /// Validates that `makeMultilineLabel()` correctly 
    /// sets the `numberOfLines` property.
    func test_makeMultilineLabel()  throws {
        let expectedText = "I am a multiline label"
        let expectedNumberOfLines = 0
        let sut = UILabel.makeMultilineLabel(text: expectedText)
        XCTAssertEqual(sut.text, expectedText)
        XCTAssertEqual(sut.numberOfLines, expectedNumberOfLines)
    }
}
