import XCTest
import os
@testable import TBCommon

/// Validation of `BaseTestCase`.
@available(macOS 11.0, *, iOS 14.0, *)
public class BaseTestCase: XCTestCase {
    public let log = Logger.testing

    /// Holds fixtures commonly available for the tests.
    public struct Fixture {
        static let localIdentifier = "en-US"
    }
}
