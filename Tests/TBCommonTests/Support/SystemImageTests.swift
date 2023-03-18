import XCTest
import SwiftUI
import os
@testable import TBCommon

/// Validation of `SystemImage`.
@available(iOS 13.0, *)
final class SystemImageTests: XCTestCase {
    /// Validates that `init?(keyName:)` properly initializes.
    func testInitKeyName() throws {
        let sut = try XCTUnwrap(TestImages(keyName: pencilCircleKeyName))
        let result = Image(imageKey: sut)
        XCTAssertEqual(result, pencilCircleImage)
    }

    /// Validates that `description` works.
    func testDescription() throws {
        let sut = try XCTUnwrap(TestImages(keyName: pencilCircleKeyName))
        XCTAssertFalse(sut.description.isEmpty)
    }

    /// Validates that `debugDescription` works as expected.
    func testDebugDescription() throws {
        let sut = try XCTUnwrap(TestImages(keyName: pencilCircleKeyName))
        XCTAssertFalse(sut.debugDescription.isEmpty)
    }

    /// Validates that we can obtain an `Image` object from `image`.
    func testImage() throws {
        let sut = try XCTUnwrap(TestImages(keyName: pencilCircleKeyName))
        let result = sut.image
        XCTAssertEqual(result, pencilCircleImage)
    }

    // MARK: - Utilities
    private var pencilCircleKeyName: String {
        TestImages.pencilCircle.rawValue
    }

    private var pencilCircleImage: Image {
        Image(imageKey: TestImages.pencilCircle)
    }
}

@available(iOS 13.0, *)
extension SystemImageTests {
    private struct Fixture {
        static let pencilCircle = Image(systemName: "pencil.circle")
    }

    private enum TestImages: String, SystemImage {
        case pencilCircle = "pencil.circle"
    }
}
