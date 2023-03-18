import XCTest
import os
@testable import TBCommon

/// Validation of `TextFile`.
final class TextFileTests: XCTestCase {
    /// Validates that `load(from:)` works as expected.
    func testLoadFromSuccess() throws {
        let filename = "files"
        let contents = try XCTUnwrap(TextFile.load(from: filename, using: .module))
        XCTAssertFalse(contents.isEmpty)
    }

    /// Validates that `load(from:)` returns `nil` if it can't find the file.
    func testLoadFromFailure() throws {
        let filename = "bogus_filename"
        XCTAssertNil(try TextFile.load(from: filename))
    }
}
