import Foundation

public enum JsonFile {
    public static func load(fromFilename filename: String,
                            in bundle: Bundle = .main) throws -> Data {
        guard let fileURL = bundle.url(forResource: filename, withExtension: "json") else {
            throw JsonFileError.fileNotFoundInBundle("\(filename).json")
        }
        
        return try Data(contentsOf: fileURL)
    }
}

public enum JsonFileError: Error {
    case fileNotFoundInBundle(String)
}
