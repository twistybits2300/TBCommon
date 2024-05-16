import XCTest
import os
@testable import TBCommon

/// Validation of `Clipboard`.
final class ClipboardTests: XCTestCase {
    private var nativePasteboard: NativePasteboard!
    private var sut: Clipboard!
    private let fixture = "This is a sentence for use in a unit test."

    override func setUpWithError() throws {
        try super.setUpWithError()

        nativePasteboard = NativePasteboard.withUniqueName()
        sut = Clipboard(native: nativePasteboard)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()

        sut = nil
        nativePasteboard = nil
    }

    /// Validates that `paste(_:String)` works as expected.
    func testPaste() throws {
        sut.paste(fixture)
        let current = try XCTUnwrap(nativePasteboardText)
        XCTAssertEqual(current, fixture)
    }

    /// Validates that `currentText` returns the expected value.
    func testCurrentText() throws {
        putOnPasteboard(fixture)
        let current = try XCTUnwrap(sut.currentText)
        XCTAssertEqual(current, fixture)
    }

    /// Validates that the combination of `paste(_:String)` and `currentText` returns the expected value.
    func testClipboardRoundtrip() throws {
        sut.paste(fixture)
        let current = try XCTUnwrap(sut.currentText)
        XCTAssertEqual(current, fixture)
    }
}

#if canImport(UIKit)
private extension ClipboardTests {
    private var nativePasteboardText: String? {
        nativePasteboard.string
    }

    private func putOnPasteboard(_ text: String) {
        nativePasteboard.string = text
    }
}

#elseif canImport(AppKit) && !targetEnvironment(macCatalyst)
private extension ClipboardTests {
    private var nativePasteboardText: String? {
        nativePasteboard.string(forType: .string)
    }

    private func putOnPasteboard(_ text: String) {
        nativePasteboard.declareTypes([.string], owner: nil)
        nativePasteboard.setString(text, forType: .string)
    }
}
#endif
