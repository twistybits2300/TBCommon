import XCTest
import SwiftUI
import os
@testable import TBCommon

/// Validation of `View+Tools`.
@available(macOS 11.0, *, iOS 14.0, *)
final class View_ToolsTests: BaseTestCase {
    /// Coverage of `log`.
    func testLogCoverage() throws {
        let view = EmptyView()
        let log: Logger? = view.log
        XCTAssertNotNil(log)
    }

    /// Coverage of `frame(square:)`.
    func testFrameSquareCoverage() throws {
        let view = EmptyView()
        _ = view.frame(square: Fixture.squareValue)
    }

    /// Coverage tests.
    func test_coverage() throws {
        let sut = EmptyView()
        _ = sut.debug("coverage for debug()")
        _ = sut.gone(true)
        _ = sut.gone(false)
    }
}

@available(macOS 11.0, *, iOS 14.0, *)
private extension BaseTestCase.Fixture {
    static let squareValue: CGFloat = 42
}
