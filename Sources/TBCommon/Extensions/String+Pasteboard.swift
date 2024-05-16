import Foundation

public extension String {
    func putOnPasteboard() {
        Clipboard.general.paste(self)
    }
}
