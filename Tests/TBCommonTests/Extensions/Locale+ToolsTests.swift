import XCTest
@testable import TBCommon
import os

/// Validation of `Locale+Tools`.
@available(macOS 11.0, *, iOS 14.0, *)
final class Locale_ToolsTests: BaseTestCase {
    private var sut: Locale!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = try XCTUnwrap(Locale(identifier: Fixture.localIdentifier))
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    /// Validates that `bcp47` returns the expected value.
    func testBCP47() throws {
        let result = try XCTUnwrap(sut.bcp47)
        log.debug("result: \(result)")
        XCTAssertEqual(result, Fixture.localIdentifier)
    }

    /*
    func testFoo() throws {
        let json = try XCTUnwrap(try TextFile.load(from: "files", type: "json"))
    }
    */
}
