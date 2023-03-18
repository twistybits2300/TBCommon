import XCTest
import os
import TBCommon

/// Validation of `Array+Tools`.
final class Array_ToolsTests: XCTestCase {
    /// Validates that `subscript (safe:)` returns a value when given a valid index.
    func testSubscriptSafeSuccess() throws {
        let expectedLetter = "c"
        let letters = ["a", "b", expectedLetter, "d", "e"]
        let result = letters[safe: 2]
        XCTAssertEqual(result, expectedLetter)
    }

    /// Validates that `subscript (safe:)` does not return a value when given an invalid index.
    func testSubscriptSafeFailure() throws {
        let letters = ["a", "b", "c", "d", "e"]
        let index = letters.count + 1
        let result = letters[safe: index]
        XCTAssertNil(result)
    }

    /// Validates the `remove(:)` function
    func testRemove() throws {
        let expectedLetter = "c"
        var letters = ["a", "b", expectedLetter, "d", "e"]
        let result = try XCTUnwrap(letters.remove(expectedLetter))
        XCTAssertEqual(result, expectedLetter)
        XCTAssertFalse(letters.contains(expectedLetter))
    }

    /// Validates that `remove(:)` returns `nil` if the given item is not in the array.
    func testRemoveReturnsNil() throws {
        let bogusLetter = "x"
        var letters = ["a", "b", "c", "d", "e"]
        let result = letters.remove(bogusLetter)
        XCTAssertNil(result)
    }
}
