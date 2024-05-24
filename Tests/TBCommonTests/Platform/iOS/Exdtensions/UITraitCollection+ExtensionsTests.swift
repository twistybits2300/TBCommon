#if os(iOS)
import XCTest
import UIKit
import os
@testable import TBCommon

/// Validation of `UITraitCollection+Extensions`.
final class UITraitCollection_ExtensionsTests: XCTestCase {
    /// Coverage for `sizeClasses`.
    func test_coverage() throws {
        let vc = UIViewController()
        let sut = vc.traitCollection
        XCTAssertFalse(sut.sizeClasses.isEmpty)
    }

}
#endif
