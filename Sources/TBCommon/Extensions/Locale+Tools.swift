import Foundation

public extension Locale {
    /// Returns the `BCP 47` identifier type if successful, `nil` otherwise.
    var bcp47: String? {
        guard let languageCode = languageCode,
              let regionCode = regionCode
        else { return nil }

        return "\(languageCode)-\(regionCode)"
    }
}
