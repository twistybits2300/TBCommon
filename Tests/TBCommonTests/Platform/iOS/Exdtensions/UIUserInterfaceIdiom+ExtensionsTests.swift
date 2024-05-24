#if os(iOS)
import XCTest
import UIKit
import os
@testable import TBCommon

/// Validation of `UIUserInterfaceIdiom+Extensions`.
@available(iOS 17.0, *)
final class UIUserInterfaceIdiom_ExtensionsTests: XCTestCase {
    /// Coverage for `descriptioon`.
    func test_coverage_description() throws {
        for idiom in UIUserInterfaceIdiom.allCases {
            XCTAssertFalse(idiom.description.isEmpty)
        }
    }

}
#endif
