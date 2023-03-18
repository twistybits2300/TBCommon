import XCTest
import os
import TBCommon

/// Validation of `Platform`.
final class PlatformTests: XCTestCase { }

// MARK: - macOS tests
#if os(macOS)
extension PlatformTests {
    /// Validates that `current` returns the expected value.
    func test_coverage_current() throws {
        XCTAssertEqual(Platform.current, .macOS)
    }

    /// Validates that `isPad` returns `false`.
    func test_isPhone_false() throws {
        let sut = Platform.current

        XCTAssertFalse(sut.isPhone)
    }

    /// Validates that `isPad` returns `false`.
    func test_isPad_false() throws {
        let sut = Platform.current

        XCTAssertFalse(sut.isPad)
    }

    /// Validates that `isMac` returns `true`.
    func test_isMac_true() throws {
        let sut = Platform.current

        XCTAssertTrue(sut.isMac)
    }
}
#endif

// MARK: - iOS/iPadOS tests
#if os(iOS)
import UIKit

extension PlatformTests {
    /// Validates that `current` returns the expected value.
    func test_coverage_current() throws {
        let sut = Platform.current

        if sut.isPhone {
            XCTAssertEqual(sut, .iOS)
        } else if sut.isPad {
            XCTAssertEqual(sut, .iPadOS)
        } else {
            XCTFail("unexpected: os(iOS) is true but got sut: \(sut.rawValue)")
        }
    }

    /// Validates that `isPad` returns `true` when the device is an iPhone, `false` otherwise.
    func test_isPhone_true() throws {
        let sut = Platform.current
        let result = sut.isPhone

        switch sut {
        case .iOS:
            XCTAssertTrue(result)
        default:
            XCTAssertFalse(result)
        }
    }

    /// Validates that `isPad` returns `true` when the device is an iPad, `false` otherwise.
    func test_isPad() throws {
        let sut = Platform.current
        let result = sut.isPad

        switch sut {
        case .iPadOS:
            XCTAssertTrue(result)
        default:
            XCTAssertFalse(result)
        }
    }

    /// Validates that `isMac` returns `false`.
    func test_isMac_false() throws {
        let sut = Platform.current

        XCTAssertFalse(sut.isMac)
    }
}
#endif
