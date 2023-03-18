import Foundation
import SwiftUI

@available(iOS 13.0, OSX 10.15, *)
public protocol L10N: CustomStringConvertible, CustomDebugStringConvertible {
    init?(keyName: String)
    var localized: String { get }
    var localizedUppercase: String { get }
    var stringKey: LocalizedStringKey { get }
}

@available(iOS 13.0, OSX 10.15, *)
extension L10N where Self: RawRepresentable, Self.RawValue == String {
    public init?(keyName: String) {
        self.init(rawValue: keyName)
    }

    public var localized: String {
        rawValue.localized()
    }

    public var localizedUppercase: String {
        localized.uppercased()
    }
    
    public var stringKey: LocalizedStringKey {
        rawValue.stringKey
    }
    
    public var description: String {
        rawValue
    }
    
    public var debugDescription: String {
        description
    }

    public func localized(withFormat arguments: CVarArg...) -> String {
        let key = NSLocalizedString(rawValue, tableName: tableName, bundle: bundle, comment: "")
        return String(format: key, arguments)
    }

    public var bundle: Bundle {
        return Bundle.main
    }

    public var tableName: String {
        return "Localizable"
    }
}

@available(iOS 13.0, OSX 10.15, *)
public extension String {
    func localized(bundle: Bundle = Bundle.main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: self.uppercased(), comment: "")
    }

    func localizedUppercase(bundle: Bundle = Bundle.main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: self.uppercased(), comment: "")
            .localizedUppercase
    }

    var stringKey: LocalizedStringKey {
        LocalizedStringKey(self)
    }
}

@available(iOS 13.0, OSX 10.15, *)
public extension Text {
    init(_ key: L10N) {
        self.init(key.stringKey)
    }
}

/*
public extension TextField {
    init(key: L10N, text: Binding<String>) {
        self.init(key.stringKey, text: text)
    }
}
*/

@available(iOS 13.0, OSX 10.15, *)
public struct AnyL10NKey: RawRepresentable, Hashable, Sendable, L10N {
    public typealias RawValue = String
    public var rawValue: RawValue

    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }

    public init(_ keyName: RawValue) {
        self.rawValue = keyName
    }
}
