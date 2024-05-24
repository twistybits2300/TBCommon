#if os(iOS)
import UIKit

extension UIUserInterfaceIdiom: CustomStringConvertible {
    public var description: String {
        switch self {
        case .unspecified:
            return "unspecified"
        case .phone:
            return "phone"
        case .pad:
            return "pad"
        case .tv:
            return "tv"
        case .carPlay:
            return "carPlay"
        case .mac:
            return "mac"
        case .vision:
            return "vision"
        @unknown default:
            return "unknown default"
        }
    }
}

@available(iOS 17.0, *)
extension UIUserInterfaceIdiom: CaseIterable {
    public static var allCases: [UIUserInterfaceIdiom] {
        [
            .unspecified, .phone, .pad, .tv, .carPlay, .mac, .vision,
        ]
    }
}
#endif
