#if os(iOS)
import XCTest
import UIKit
import os
@testable import TBCommon

/// Validation of `UIUserInterfaceSizeClass+Extensions`.
final class UIUserInterfaceSizeClass_ExtensionsTests: XCTestCase {
    /// Coverage for `description`.
    func test_coverage_description() throws {
        for sizeClass in UIUserInterfaceSizeClass.allCases {
            XCTAssertFalse(sizeClass.description.isEmpty)
        }
    }

}
#endif
