import XCTest
import SwiftUI
import os
@testable import TBCommon

/// Validation of `TwistyBitsIcon`.
@available(iOS 13.0, OSX 10.15, *)
final class TwistyBitsIconTests: XCTestCase {
    /// Validates that `init(iconSize:itemSpacing:backgroundColor)` works as expected.
    func test_init_success() throws {
        let expectedIconSize: CGFloat = 12
        let expectedItemSpacing: CGFloat = 34
        let expectedBackgroundColor: Color = try XCTUnwrap(Color.randomCrayonColor)
        let sut = TwistyBitsIcon(iconSize: expectedIconSize,
                                 itemSpacing: expectedItemSpacing,
                                 backgroundColor: expectedBackgroundColor)

        XCTAssertEqual(sut.iconSize, expectedIconSize)
        XCTAssertEqual(sut.itemSpacing, expectedItemSpacing)
        XCTAssertEqual(sut.backgroundColor, expectedBackgroundColor)

        // Coverage for `body`.
        _ = sut.body
    }
}
