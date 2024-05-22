#if os(iOS)
import XCTest
import UIKit
import os
@testable import TBCommon

/// Validation of `StoryboardSegueIdentifiable`.
@available(iOS 14.0, *)
final class StoryboardSegueIdentifiableTests: XCTestCase {
    private let fixture = TestFixture()
    
    /// Validates that `segueIdentifier(for:)` throws an error when the segue's `identifier` is `nil`.
    func test_segueIdentifierFor_nil() throws {
        let sut = fixture.makeSUT()
        let destinationVC = fixture.makeVC()
        let segue = fixture.makeSegue(identifier: nil, source: sut, destination: destinationVC)
        XCTAssertThrowsError(try sut.segueIdentifier(for: segue))
    }
    
    /// Validates that `segueIdentifier(for:)` throws an error when given an unknown `identifier`.
    func test_segueIdentifierFor_unknown() throws {
        let sut = fixture.makeSUT()
        let identifier = "bogusID"
        let destinationVC = fixture.makeVC()
        let segue = fixture.makeSegue(identifier: identifier, source: sut, destination: destinationVC)
        XCTAssertThrowsError(try sut.segueIdentifier(for: segue))
    }
    
    /// Validates that `segueIdentifier(for:)` works correctly when manually creating a segue
    /// using a known `SegueID` value.
    func test_segueIdentifierFor_manual() throws {
        let sut = fixture.makeSUT()
        let expectedID = try XCTUnwrap(TestViewController.SegueID(rawValue: "showThirdScene"))
        let identifier = expectedID.rawValue
        let destinationVC = fixture.makeVC()
        let segue = fixture.makeSegue(identifier: identifier, source: sut, destination: destinationVC)
        let result = try XCTUnwrap(try? sut.segueIdentifier(for: segue))
        XCTAssertEqual(result, expectedID)
    }
    
    /// Validates that `segueIdentifier(for:)` returns the expected value.
    func test_segueIdentifierFor()  throws {
        let sut = fixture.makeSUT()
        let destinationVC = fixture.makeVC()
        let expectedID = TestViewController.SegueID.showFirstScene
        let identifier = expectedID.rawValue
        let segue = fixture.makeSegue(identifier: identifier, source: sut, destination: destinationVC)
        let result = try XCTUnwrap(try? sut.segueIdentifier(for: segue))
        XCTAssertEqual(result, expectedID)
    }
}

private final class TestViewController: UIViewController, StoryboardSegueIdentifiable {
    typealias SegueIdentifier = SegueID
    
    private(set) var firstVC: UIViewController?
    private(set) var secondVC: UIViewController?
    private(set) var thirdVC: UIViewController?
  
    // MARK: - Segues
    struct SegueID: RawRepresentable, Equatable {
        static let showFirstScene = SegueID(name: "showFirstScene")
        static let showSecondScene = SegueID(name: "showSecondScene")
        static let showThirdScene = SegueID(name: "showThirdScene")
        
        typealias RawValue = String
        let rawValue: String
        
        init?(rawValue: String) {
            guard Self.allNames.contains(rawValue) else { return nil }
            
            self.rawValue = rawValue
        }
        
        init(name: String) {
            rawValue = name
        }
        
        init?(string: String?) {
            guard let name = string else { return nil }
            self.init(name: name)
        }
        
        // MARK: Equatable
        static func ==(left: SegueID, right: SegueID) -> Bool {
            return left.rawValue == right.rawValue
        }
        
        private static var allNames: [String] {
            [
                showFirstScene.rawValue,
                showSecondScene.rawValue,
                showThirdScene.rawValue
            ]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
              let segueID = SegueID(string: identifier)
        else { return }
        
        switch segueID {
        case .showFirstScene:
            firstVC = segue.destination
        case .showSecondScene:
            secondVC = segue.destination
        case .showThirdScene:
            thirdVC = segue.destination
        default:
            break
        }
    }
}

private struct TestFixture {
    func makeVC() -> UIViewController {
        UIViewController()
    }
    
    func makeSUT() -> TestViewController {
        TestViewController()
    }
    
    func makeSegue(identifier: String?, 
                   source: UIViewController,
                   destination: UIViewController) -> UIStoryboardSegue {
        UIStoryboardSegue(identifier: identifier, source: source, destination: destination)
    }
}
#endif
