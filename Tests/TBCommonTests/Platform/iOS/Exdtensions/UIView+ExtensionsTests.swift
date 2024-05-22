#if os(iOS)
import XCTest
import UIKit
import os
@testable import TBCommon

/// Validation of `UIView+Extensions`.
final class UIView_ExtensionsTests: XCTestCase {
    /// Validates that `makeView(color:usesAutolayout:)` correctly captures the given parameters.
    func test_makeView_parameters() throws {
        let expectedColor = UIColor.systemIndigo
        let expectedUsesAutolayout = false
        let sut = UIView.makeView(color: expectedColor, usesAutolayout: expectedUsesAutolayout)
        XCTAssertEqual(sut.backgroundColor, expectedColor)
        XCTAssertTrue(sut.translatesAutoresizingMaskIntoConstraints)
    }
    
    /// Validates that `makeView()` returns the expected values when using default values
    /// for the parameters.
    func test_makeView_default() throws {
        let expectedColor = UIColor.systemBackground
        let sut = UIView.makeView()
        XCTAssertEqual(sut.backgroundColor, expectedColor)
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints)
    }
}
#endif
