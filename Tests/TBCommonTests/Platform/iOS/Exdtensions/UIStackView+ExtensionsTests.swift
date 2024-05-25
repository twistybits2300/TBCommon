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
    
    /// Validates that `addBackgroundView()` works as expected.
    func test_addBackgroundView() throws {
        let subviews = fixture.subviews
        let sut = UIStackView.verticalStack(subviews: subviews)
        XCTAssertEqual(sut.subviews.count, 2)

        let backgroundView = sut.addBackgroundView(color: .red)
        
        let firstView = try XCTUnwrap(sut.subviews.first)
        XCTAssertEqual(firstView, backgroundView)
    }
    
    /// Validates that `addForegroundView()` works as expected.
    func test_addForegroundView() throws {
        let subviews = fixture.subviews
        let expectedIndex = subviews.count

        let sut = UIStackView.verticalStack(subviews: subviews)
        XCTAssertEqual(sut.subviews.count, 2)

        let foregroundView = sut.addForegroundView(color: .red)
        XCTAssertEqual(sut.subviews.count, 3)

        let returnedView = sut.subviews[expectedIndex]
        XCTAssertEqual(returnedView, foregroundView)
    }
    
    /// Validates that `addChildView(color:radius:at:)` works as expected.
    func test_addChild_default() throws {
        let subviews = fixture.subviews
        let sut = UIStackView.verticalStack(subviews: subviews)
        XCTAssertEqual(sut.subviews.count, 2)
        
        
        let addedView = sut.addChildView(color: .black)
        XCTAssertEqual(sut.subviews.count, 3)
        XCTAssertEqual(addedView.layer.cornerRadius, 0)
        
        let firstView = try XCTUnwrap(sut.subviews.first)
        XCTAssertEqual(firstView, addedView)
    }
    
    /// Validates that `addChildView(color:radius:at:)` properly inserts
    /// the new view at the indicated index.
    func test_addChild() throws {
        let subviews = fixture.subviews
        let expectedIndex = subviews.count - 1

        let sut = UIStackView.verticalStack(subviews: subviews)
        XCTAssertEqual(sut.subviews.count, 2)

        let addedView = sut.addChildView(color: .blue, at: expectedIndex)
        XCTAssertEqual(sut.subviews.count, 3)
        
        let returnedView = sut.subviews[expectedIndex]
        XCTAssertEqual(returnedView, addedView)
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
