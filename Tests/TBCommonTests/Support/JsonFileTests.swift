import XCTest
import os
@testable import TBCommon

/// Validation of `JsonFile`.
final class JsonFileTests: XCTestCase {
    /// Validates that `load(from:)` returns `nil` if it can't find the file.
    func testLoadFromFailure() throws {
        let filename = "bogus_filename"
        XCTAssertThrowsError(try JsonFile.load(fromFilename: filename))
    }
    
    /// Validates that `load(from:)` works as expected.
    func testLoadFromSuccess() throws {
        let filename = "f1_seasons"
        let data = try XCTUnwrap(JsonFile.load(fromFilename: filename, in: .module))
        XCTAssertFalse(data.isEmpty)
    }
}
