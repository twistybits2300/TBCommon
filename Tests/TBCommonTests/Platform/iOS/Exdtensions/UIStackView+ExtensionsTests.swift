import XCTest
import UIKit
import os
@testable import TBCommon

/// Validation of `UIStackView+Extensions`.
final class UIStackView_ExtensionsTests: XCTestCase {
    private let fixture = TestFixture()

    /// Validates that `horizontalStack()` works correctly.
    func test_horizontalStack() throws {
        let subviews = fixture.subviews
        let sut = UIStackView.horizontalStack(subviews: subviews,
                                              distribution: fixture.distribution,
                                              alignment: fixture.alignment,
                                              spacing: fixture.spacing)
        XCTAssertEqual(sut.axis, .horizontal)
        XCTAssertEqual(sut.arrangedSubviews, subviews)
        XCTAssertEqual(sut.distribution, fixture.distribution)
        XCTAssertEqual(sut.alignment, fixture.alignment)
        XCTAssertEqual(sut.spacing, fixture.spacing)
    }

    /// Validates that `verticalStack()` works correctly.
    func test_verticalStack() throws {
        let subviews = fixture.subviews
        let sut = UIStackView.verticalStack(subviews: subviews,
                                            distribution: fixture.distribution,
                                            alignment: fixture.alignment,
                                            spacing: fixture.spacing)
        XCTAssertEqual(sut.axis, .vertical)
        XCTAssertEqual(sut.arrangedSubviews, subviews)
        XCTAssertEqual(sut.distribution, fixture.distribution)
        XCTAssertEqual(sut.alignment, fixture.alignment)
        XCTAssertEqual(sut.spacing, fixture.spacing)
    }
}

private struct TestFixture {
    var subviews: [UIView] {
        [UIView(), UIView()]
    }
    
    var distribution: UIStackView.Distribution {
        .fillProportionally
    }
    
    var alignment: UIStackView.Alignment {
        .top
    }
    
    var spacing: CGFloat {
        12.34
    }
}
