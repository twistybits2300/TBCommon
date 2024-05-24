import XCTest
import os
@testable import TBCommon

/// Validation of `CGSize+Extensions`.
final class CGSize_ExtensionsTests: XCTestCase {
    /// Coverage of `intDescription`.
    func test_intDescription() throws {
        let width: CGFloat = 123.45
        let height: CGFloat = 234.56
        let size = CGSize(width: width, height: height)
        let result = size.intDescription
        XCTAssertFalse(result.isEmpty)
    }
}
