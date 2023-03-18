import Foundation

#if os(iOS)
import UIKit
#endif

public enum Platform: String {
    case iOS
    case iPadOS
    case macOS

    public static var current: Platform {
        #if os(iOS)
        return UIDevice.current.userInterfaceIdiom == .pad ? .iPadOS : iOS
        #elseif os(macOS)
        return .macOS
        #endif
    }

    public var isPhone: Bool {
        #if os(iOS)
        return UIDevice.current.userInterfaceIdiom == .phone
        #else
        return false
        #endif
    }

    public var isPad: Bool {
        #if os(iOS)
        return UIDevice.current.userInterfaceIdiom == .pad
        #else
        return false
        #endif
    }

    public var isMac: Bool {
        #if os(macOS)
        return true
        #else
        return false
        #endif
    }
}
