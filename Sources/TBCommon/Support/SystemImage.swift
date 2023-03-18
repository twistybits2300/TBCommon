import Foundation
import SwiftUI

public protocol SystemImage: CustomStringConvertible, CustomDebugStringConvertible {
    init?(keyName: String)
}

@available(macOS 11.0, *, iOS 13.0, *)
public extension SystemImage where Self: RawRepresentable, Self.RawValue == String  {
    init?(keyName: String) { self.init(rawValue: keyName) }
    var description: String { rawValue }
    var debugDescription: String { rawValue }
    var image: Image { Image(systemName: rawValue) }
}

@available(macOS 11.0, *, iOS 13.0, *)
public extension Image {
    init(imageKey: SystemImage) {
        self.init(systemName: imageKey.description)
    }
}
