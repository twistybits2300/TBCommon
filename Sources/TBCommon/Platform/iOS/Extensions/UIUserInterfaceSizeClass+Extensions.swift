#if os(iOS)
import UIKit

extension UIUserInterfaceSizeClass: CustomStringConvertible {
    public var description: String {
        switch self {
        case .unspecified:
            return "unspecified"
        case .compact:
            return "compact"
        case .regular:
            return "regular"
        @unknown default:
            return "unknown default"
        }
    }
}

extension UIUserInterfaceSizeClass: CaseIterable {
    public static var allCases: [UIUserInterfaceSizeClass] {
        [
            .unspecified, .compact, .regular,
        ]
    }
}
#endif
