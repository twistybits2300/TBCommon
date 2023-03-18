import XCTest
import os
@testable import TBCommon

/// Validation of `OSLog+Extensions`.
@available(iOS 14.0, *)
final class OSLog_ExtensionsTests: XCTestCase {
    /// Validates that `init(category:)` can properly initialize when given a `category` string.
    func test_init_category() throws {
        let expectedCategory = "1234567890"
        _ = Logger(category: expectedCategory)
        Logger.testing.debug(">>> default: \(LoggingProvider.Subsystem.default)")
    }
}
