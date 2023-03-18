import XCTest
import os.log
@testable import TBCommon

/// Validation for the code in `Optional+Tools`.
final class Optional_ToolsTests: XCTestCase {
    /// Validate `isNotNil` returns `true`.
    func testIsNotNilTrue() throws {
        let thing: String? = "spot"
        XCTAssertTrue(thing.isNotNil)
    }
    
    /// Validate `isNotNil` returns `false`.
    func testIsNotNilFalse() throws {
        let thing: String? = nil
        XCTAssertFalse(thing.isNotNil)
    }
    
    /// Validate `isNil` returns `true`.
    func testIsNilTrue() throws {
        let thing: String? = nil
        XCTAssertTrue(thing.isNil)
    }
    
    /// Validate `isNil` returns `false`.
    func testIsNilFalse() throws {
        let thing: String? = "tops"
        XCTAssertFalse(thing.isNil)
    }

    /* I don't like `unwrap()` so commenting this out,
     until I have an actual use for it.
    /// Validates that `unwrap()` works as expected.
    func testUnwrap() throws {
        let expectedThing = "a gift"
        let thing: String? = expectedThing
        let unwrapped = thing.unwrap("testUnwrap(), please!")
        XCTAssertEqual(unwrapped, expectedThing)
    }
    */

    /// Validates that `orNil` works as expected when the `Optional` is `nil`.
    func testOrNilReturnsNilString() throws {
        let sut: String? = nil
        let result = sut.orNil
        XCTAssertTrue(result.contains("nil"))
    }
    
    /// Validates that `orNil` returns the wrapped value when the `Optional` is non-`nil`.
    func testOrNil() throws {
        let expectedResult = "here we go"
        let sut: String? = expectedResult
        let result = sut.orNil
        XCTAssertEqual(result, expectedResult)
    }
    
    /// Validates that `orEmpty` works as expected when the `Optional` is `nil`.
    func testOrEmptyReturnsEmptyString() throws {
        let expectedResult = ""
        let sut: String? = nil
        let result = sut.orEmpty
        XCTAssertEqual(result, expectedResult)
    }
    
    /// Validates that `orEmpty` works the wrapped value when the `Optional` is non-`nil`.
    func testOrEmpty() throws {
        let expectedResult = "something to think about"
        let sut: String? = expectedResult
        let result = sut.orEmpty
        XCTAssertEqual(result, expectedResult)
    }
}

