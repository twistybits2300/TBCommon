import os.log

@available(macOS 10.12, *)
@available(iOS 10.0, *)
extension OSLog {
    static let commoncode = OSLog(subsystem: subsystem, category: "commoncode")
    static let cloudstore = OSLog(subsystem: subsystem, category: "cloudstore")

    public static var subsystem: String { "commoncode" }
}

@available(macOS 10.12, *)
@available(iOS 10.0, *)
public func os_log(_ message: String, log: OSLog = .default, error: Error) {
    os.os_log("%@: %@", log: log, type: .error, message, String(reflecting: error))
}
