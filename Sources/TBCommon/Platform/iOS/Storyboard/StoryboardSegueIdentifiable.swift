#if os(iOS)
import UIKit

/// Used for strongly typing a `UIStoryboardSegue` `identifier`.
public protocol StoryboardSegueIdentifiable {
    associatedtype SegueIdentifier: RawRepresentable
}

@available(iOS 14.0, *)
public extension StoryboardSegueIdentifiable where Self: UIViewController, SegueIdentifier.RawValue == String {
    // MARK: Public API
    /// Programmatically performs a segue using the provided `segueIdentifier`
    /// - Parameters:
    ///   - segueIdentifier: The strongly-typed segue identifier for the segue to be performed.
    ///   - sender: The entity that's making the request for performing the segue.
    func performSegueWithIdentifier(segueIdentifier: SegueIdentifier, sender: AnyObject?) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: sender)
    }
    
    /// Given a `segue`, returns the strongly-typed `SegueIdentifier` associated with it.
    /// - Parameter segue: The segue to be checked for the identifier.
    /// - Returns: A non-`nil` value if the identifier is found; `nil` otherwise.
    /// - Throws: `StoryboardSegueError.invalidSegueIdentifier(String)` if
    /// the given `segue` has a `nil` value for its `identifier` property,
    /// or if the non-`nil` value of that segue identifier is not a known
    /// `SegueIdentifier` value.
    func segueIdentifier(`for` segue: UIStoryboardSegue) throws -> SegueIdentifier {
        guard let identifier = segue.identifier,
              let segueIdentifier = SegueIdentifier(rawValue: identifier)
        else {
            throw StoryboardSegueError.invalidSegueIdentifier(segue.identifier)
        }
        
        return segueIdentifier
    }
}

/// Indicates an error occurred when working with `StoryboardSegueIdentifiable`.
///
/// - `invalidSegueIdentifier(String?)`: A `nil` `UIStoryboardSegue` `identifier`
/// or unknown `SegueIdentifier` value was encountered.
public enum StoryboardSegueError: Error {
    case invalidSegueIdentifier(String?)
}
#endif
