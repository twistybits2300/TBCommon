import XCTest
import os
@testable import TBCommon

/// Validation of `BinaryFloatingPoint+Extensions`.
final class BinaryFloatingPoint_ExtensionsTests: XCTestCase {
    /// Validates that `intValue` returns the expected value.
    func test_intValue() throws {
        let number: Double = 1234.56
        let expectedValue = Int(number)
        XCTAssertEqual(number.intValue, expectedValue)
    }
}
