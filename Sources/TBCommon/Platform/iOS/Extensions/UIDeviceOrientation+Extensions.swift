#if os(iOS)
import UIKit

extension UIDeviceOrientation: CustomStringConvertible {
    public var description: String {
        switch self {
        case .unknown:
            return "unknown"
        case .portrait:
            return "portrait"
        case .portraitUpsideDown:
            return "portraitUpsideDown"
        case .landscapeLeft:
            return "landscapeLeft"
        case .landscapeRight:
            return "landscapeRight"
        case .faceUp:
            return "faceUp"
        case .faceDown:
            return "faceDown"
        @unknown default:
            return "unknown default"
        }
    }
}

extension UIDeviceOrientation: CaseIterable {
    public static var allCases: [UIDeviceOrientation] {
        [
            .unknown, .portrait, .portraitUpsideDown, .landscapeLeft, .landscapeRight, .faceUp, .faceDown,
        ]
    }
}
#endif
