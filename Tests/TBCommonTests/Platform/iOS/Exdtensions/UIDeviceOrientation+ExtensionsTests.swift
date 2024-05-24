#if os(iOS)
import XCTest
import UIKit
import os
@testable import TBCommon

/// Validation of `UIDeviceOrientation+Extensions`.
final class UIDeviceOrientation_ExtensionsTests: XCTestCase {
    /// Coverage of `description`.
    func test_description() throws {
        for orientation in UIDeviceOrientation.allCases {
            XCTAssertFalse(orientation.description.isEmpty)
        }
    }
}
#endif
