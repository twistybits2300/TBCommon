#if os(iOS)
import XCTest
import UIKit
import os
@testable import TBCommon

/// Validation of `NSDirectionalEdgeInsets+Extensions`.
final class NSDirectionalEdgeInsets_ExtensionsTests: XCTestCase {
    /// Validates that `init(all:)` correctly sets all edge values to the given value.
    func test_initAll() throws {
        let value: CGFloat = 123.45
        let sut: NSDirectionalEdgeInsets = .init(all: value)
        XCTAssertEqual(sut.bottom, value)
        XCTAssertEqual(sut.top, value)
        XCTAssertEqual(sut.leading, value)
        XCTAssertEqual(sut.trailing, value)
    }
}
#endif
