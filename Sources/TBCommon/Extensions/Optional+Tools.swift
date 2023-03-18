import Foundation

public extension Optional {
    /// Returns `true` if this item is not `nil`; `false` if it is.
    var isNotNil: Bool { return isNil == false }

    /// Returns `true` if this item is `nil`; `false` otherwise.
    var isNil: Bool {
        switch self {
        case .some(_): return false
        case .none: return true
        }
    }

    /*
    /// Provides a way of safely unwrapping an `Optional`, for instance in situations where a non-`nil` return value
    /// is needed. A `fatalError` is thrown if this is `nil`.
    /// - Parameters:
    ///   - reason: The message that's printed to the console upon encountering an error.
    func unwrap(_ reason: String, file: StaticString = #file, line: UInt = #line) -> Wrapped {
        guard let value = self else {
            fatalError(reason, file: file, line: line)
        }
        return value
    }
    */
}

extension Optional where Wrapped == String {
    /// Returns "nil" if this optional's value is `nil`, otherwise the non-`nil` value.
    public var orNil: String {
        return self ?? "nil"
    }

    /// Returns "" if this optional's value is `nil`, otherwise the non-`nil` value.
    public var orEmpty: String {
        return self ?? ""
    }
}
