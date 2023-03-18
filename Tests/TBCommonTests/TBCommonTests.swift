import XCTest
@testable import TBCommon

final class TBCommonTests: XCTestCase {
    /// Validates that `init()` works as expected.
    func test_init_success() throws {
        _ = TBCommon()
    }
}
