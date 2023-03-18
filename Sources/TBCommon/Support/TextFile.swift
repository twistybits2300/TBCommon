import Foundation

public struct TextFile {
    /// Loads text from the file of the given `name` that's found in the `Bundle`.
    ///
    /// - Parameters:
    ///   - name: The name of the bundled file to be loaded.
    ///   - type: The file extension; defaults to `.txt`.
    ///   - encoding: The `String.Encoding` of the file; defaults to `.utf8`.
    ///   - bundle: The bundle to use; defaults to `Bundle.main`.
    /// - Returns: The loaded text if successful; may be `nil`.
    /// - Throws: value from `String(contentsOfFile:)`
    public static func load(from name: String,
                            type: String = "txt",
                            encoding: String.Encoding = .utf8,
                            using bundle: Bundle = Bundle.main) throws -> String?
    {
        guard let path = bundle.path(forResource: name, ofType: type) else {
            return nil
        }

        return try String(contentsOfFile: path)
    }
}
