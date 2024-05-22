#if os(iOS)
import UIKit

public extension UIViewController {
    /// Instantiates the initial view controller from the storyboard
    /// of the given `name` in the given `bundle`.
    /// - Parameters:
    ///   - name: The storyboard name.
    ///   - bundle: The bundle containing the storyboard.
    /// - Returns: The initial view controller from the storyboard.
    /// May be `nil`.
    static func initialViewController(fromStoryboardNamed name: String,
                                      bundle: Bundle? = nil) -> UIViewController? {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        return storyboard.instantiateInitialViewController()
    }
    
    /// Instantiates a view controller from a storyboard by the
    /// view controller's `storyboardID` identifier (the value
    /// that's set in Interface Builder in the storyboard).
    /// - Parameters:
    ///   - name: The name of the storyboard.
    ///   - bundle: The bundle containing the storyboard.
    ///   - identifier: The view controller's `storyboardID`
    /// - Returns: The view controller associated with the given `storyboardID`.
    /// May be `nil`.
    static func fromStoryboard(
        named name: String,
        bundle: Bundle? = nil,
        withIdentifier identifier: String) -> UIViewController?
    {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}
#endif
