import XCTest
import os.log
@testable import TBCommon

/// Validation of the code in `String+Localization`.
@available(iOS 13.0, *)
final class String_LocalizationTests: XCTestCase {
    private let keyString = "fake_localization_key"
    
    /// Validates that `localized` works as expected.
    func testLocalized() throws {
        XCTAssertFalse(StringKeys.frameworkName.localized.isEmpty)
    }
    
    /// Validates that `stringKey` works as expected.
    func testStringKey() throws {
        _ = StringKeys.frameworkName.stringKey
    }
    
    /// Validates that `description` works as expected.
    func testDescription() throws {
        XCTAssertFalse(StringKeys.frameworkName.description.isEmpty)
    }
    
    /// Validates that `debugDescription` works as expected.
    func testDebugDescription() throws {
        XCTAssertFalse(StringKeys.frameworkName.debugDescription.isEmpty)
    }
    
    /// Validate `String`'s `localized()` function works as expected
    func testStringLocalized() throws {
        XCTAssertFalse(keyString.localized().isEmpty)
    }

    /// Validates that `init?(keyName:)` works as expected.
    func testInitKeyName() throws {
        let keyName = StringKeys.frameworkName.rawValue
        let sut = try XCTUnwrap(StringKeys(keyName: keyName))
        XCTAssertEqual(sut, StringKeys.frameworkName)
    }

    /// Validates that `localized(withFormat:)` works as expected.
    func testLocalizedWithFormat() throws {
        let key = StringKeys.testFormat
        let argument = 12345
        XCTAssertFalse(key.localized(withFormat: argument).isEmpty)
    }

    /// Validates that `String.localizedUppercase` works as expected.
    func testStringLocalizedUppercase() throws {
        let key = StringKeys.frameworkName
        XCTAssertFalse(key.localizedUppercase.isEmpty)
        XCTAssertFalse(key.rawValue.localizedUppercase().isEmpty)
    }

    /// Validates that `AnyL10NKey` can be initialized using a raw value.
    func testAnyL10NKeyInitRawValue() throws {
        let key = StringKeys.frameworkName
        _ = AnyL10NKey(rawValue: key.rawValue)
    }

    /// Validates that `AnyL10NKey` can be initialized using a key name.
    func testAnyL10NKeyInitKeyName() throws {
        let keyName = StringKeys.frameworkName.rawValue
        _ = AnyL10NKey(keyName)
    }
    
    func testStringStringKey() throws {
        _ = keyString.stringKey
    }

    private enum StringKeys: String, L10N {
        case frameworkName = "framework_name"
        case formattedText = ""
        case testFormat = "%3.2f"
    }
}

import SwiftUI

@available(iOS 13.0, *)
extension String_LocalizationTests {
    /// Validates that `Text(_ key: L10N)` works as expected.
    func testTextInit() throws {
        _ = Text(StringKeys.frameworkName)
    }
}
