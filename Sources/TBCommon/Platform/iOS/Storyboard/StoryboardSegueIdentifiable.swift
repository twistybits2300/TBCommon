#if os(iOS)
import UIKit
import os

public protocol StoryboardSegueIdentifiable {
    associatedtype SegueIdentifier: RawRepresentable
}

@available(iOS 14.0, *)
public extension StoryboardSegueIdentifiable where Self: UIViewController, SegueIdentifier.RawValue == String {
    // MARK: Public API
    func performSegueWithIdentifier(segueIdentifier: SegueIdentifier, sender: AnyObject?) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: sender)
    }
    
    func segueIdentifier(`for` segue: UIStoryboardSegue) throws -> SegueIdentifier {
        guard let identifier = segue.identifier,
              let segueIdentifier = SegueIdentifier(rawValue: identifier)
        else {
            log.error("Invalid segue identifier \(String(describing: segue.identifier)).")
            throw StoryboardSegueError.invalidSegueIdentifier(segue.identifier)
        }
        
        return segueIdentifier
    }
    
    private var log: Logger {
        Logger.ui
    }
}

public enum StoryboardSegueError: Error {
    case invalidSegueIdentifier(String?)
}
#endif
