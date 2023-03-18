import Foundation
import os

@available(iOS 14.0, macOS 11.0, *)
public extension Logger {
    init(subsystem: LoggingProvider.Subsystem = .default, category: LoggingProvider.Category = .default) {
        self.init(subsystem: subsystem, category: category.rawValue)
    }

    init(category: String) {
        self.init(subsystem: .default, category: LoggingProvider.Category(rawValue: category))
    }
}

@available(iOS 14.0, macOS 11.0, *)
public extension Logger {
    static let `default`: LoggingProvider.Category = .none
    static let app        = Logger(category: .app)
    static let background = Logger(category: .background)
    static let database   = Logger(category: .database)
    static let effect     = Logger(category: .effect)
    static let networking = Logger(category: .networking)
    static let reducer    = Logger(category: .reducer)
    static let store      = Logger(category: .store)
    static let testing    = Logger(category: .testing)
    static let ui         = Logger(category: .ui)
}

@available(iOS 10.0, macOS 11.0, *)
public struct LoggingProvider {
    public typealias Subsystem = String

    public struct Category: Hashable, Equatable, RawRepresentable {
        public typealias RawValue = String
        public let rawValue: RawValue
        public init(rawValue: RawValue) {
            self.rawValue = rawValue
        }
    }
}

@available(iOS 10.0, macOS 11.0, *)
public extension LoggingProvider.Subsystem {
    static var `default` = "   default"
}

@available(iOS 10.0, macOS 11.0, *)
public extension LoggingProvider.Category {
    static let `default`: LoggingProvider.Category = .none
    static let app        = LoggingProvider.Category(rawValue: "       app")
    static let background = LoggingProvider.Category(rawValue: "background")
    static let database   = LoggingProvider.Category(rawValue: "  database")
    static let effect     = LoggingProvider.Category(rawValue: "    effect")
    static let networking = LoggingProvider.Category(rawValue: "networking")
    static let none       = LoggingProvider.Category(rawValue: "          ")
    static let reducer    = LoggingProvider.Category(rawValue: "   reducer")
    static let store      = LoggingProvider.Category(rawValue: "     store")
    static let testing    = LoggingProvider.Category(rawValue: "   testing")
    static let ui         = LoggingProvider.Category(rawValue: "        ui")    
    static let unittest   = LoggingProvider.Category(rawValue: "  unittest")
}
