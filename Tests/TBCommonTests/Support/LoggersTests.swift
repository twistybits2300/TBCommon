import XCTest
import os.log
@testable import TBCommon

/// Validation of `Loggers`.
@available(iOS 10.0, *)
final class LoggersTests: XCTestCase {
    /// Coverage for `f1_2022`.
    func testCommonCode() throws {
        os_log("testCommonCode says hi!", log: .commoncode, type: .debug)
    }
    
    /// Coverage for `os_log(:String,:OSLog,:Error)`.
    func testOsLogError() throws {
        os_log("Error testOsLogError omg!", log: .commoncode, error: FakeError.somethingBadHappened)
    }
}
