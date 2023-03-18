import Foundation
import SwiftUI

public protocol SystemImage: CustomStringConvertible, CustomDebugStringConvertible {
    init?(keyName: String)
}

@available(iOS 13.0, *)
@available(macOS 11.0, *)
public extension SystemImage where Self: RawRepresentable, Self.RawValue == String  {
    init?(keyName: String) { self.init(rawValue: keyName) }
    var description: String { rawValue }
    var debugDescription: String { rawValue }
    var image: Image { Image(systemName: rawValue) }
}

@available(iOS 13.0, *)
@available(macOS 11.0, *)
public extension Image {
    init(imageKey: SystemImage) {
        self.init(systemName: imageKey.description)
    }
}
