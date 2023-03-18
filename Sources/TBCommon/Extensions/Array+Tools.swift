import Foundation

public extension Array {
    /// Safe subscript that returns `nil` if the given `index` is out of bounds.
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}

public extension Array where Element : Equatable {
    /// Provides a simple means for removing an item from this array. The item must implement `Equatable`.
    /// - Parameter item: The `Equatable` item to be removed.
    /// - Returns: The item that was removed if successful; `nil` otherwise. The result can be ignored.
    @discardableResult
    mutating func remove(_ item: Element) -> Element? {
        guard let index = self.firstIndex(where: { $0 == item }) else { return nil }
        return self.remove(at: index)
    }
}
