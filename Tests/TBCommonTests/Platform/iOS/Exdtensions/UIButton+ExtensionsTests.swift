#if os(iOS)
import XCTest
import UIKit
import os
@testable import TBCommon

/// Validation of `UIButton+Extensions`.
@available(iOS 15, *)
final class UIButton_ExtensionsTests: XCTestCase {
    private let fixture = TestFixture()
    
    /// Validates that `makeButton()` uses `title` when `titleFontSize` is `nil`.
    func test_makeButton_nil_titleFontSize() throws {
        let sut = fixture.makeDefaultSUT()
        XCTAssertEqual(sut.configuration?.title, Default.title)
    }
    
    /// Validates that `makeButton()` uses the expected `titleFontSize`.
    func test_makeButton_titleFontSize() throws {
        let sut = fixture.makeSUT()
        let attributedTitle = try XCTUnwrap(sut.configuration?.attributedTitle)
        let titleText = String(attributedTitle.characters)
        XCTAssertEqual(titleText, Default.title)
    }

    /// Coverage of `makeToolbar()`.
    func test_makeToolbar_coverage() throws {
        let iconName = "heart"
        let imageScale = UIImage.SymbolScale.small
        let action = Default.action
        let sut = UIButton.makeToolbarButton(iconName: iconName,
                                             imageScale: imageScale,
                                             action: action)
        print(String(describing: sut))
    }
}

private enum Default {
    static var title: String { "I am a button" }
    static var tintColor: UIColor { .systemIndigo }
    static var titleFontSize: CGFloat { 60.0 }
    static var action: UIAction { UIAction { _ in } }
}

@available(iOS 15, *)
private struct TestFixture {
    static let testVC = TestViewController()
    
    func makeDefaultSUT(title: String = Default.title,
                        tintColor: UIColor = Default.tintColor) -> UIButton {
        UIButton.makeButton(title: title, 
                            tintColor: tintColor,
                            target: Self.testVC,
                            selector: testSelector)
    }
    
    func makeSUT(title: String = Default.title,
                 tintColor: UIColor = Default.tintColor,
                 titleFontSize: CGFloat = Default.titleFontSize) -> UIButton {
        UIButton.makeButton(title: title,
                            tintColor: tintColor,
                            titleFontSize: titleFontSize,
                            target: Self.testVC,
                            selector: testSelector)
    }
    
    var testSelector: Selector {
        #selector(TestViewController.doNothing)
    }
}

private final class TestViewController: UIViewController {
    @objc
    static func doNothing() { }
}
#endif
