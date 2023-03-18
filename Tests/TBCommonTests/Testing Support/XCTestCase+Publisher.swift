import Foundation
import Combine
import XCTest

@available(iOS 13.0, *)
public extension XCTestCase {
    /// Uses an expectation to wait for the given `publisher` to send a value.
    /// - Parameters:
    ///   - publisher: The publisher to wait for receiving the value of.
    ///   - performPublish: The action to perform to trigger publishing a value.
    ///   - timeout: The timeout before the test fails.
    ///   - file: File info.
    ///   - line: Line info.
    /// - Returns: The result value if successful; test failure otherwise.
    func waitForValue<T: Publisher>(for publisher: T,
                                    publishAction performPublish: () -> Void,
                                    timeout: TimeInterval = XCTestCase.defaultTimeout,
                                    file: StaticString = #filePath,
                                    line: UInt = #line) throws -> T.Output where T.Failure == Never {
        var result: Result<T.Output, Error>?
        let ex = expectation(description: "waitForValue(publisher:)")

        let cancellable = publisher.sink(receiveValue: { value in
            result = .success(value)
            ex.fulfill()
        })

        performPublish()

        waitForExpectations(timeout: timeout)
        cancellable.cancel()

        let value = try XCTUnwrap(result, "failed: no output from publisher", file: file, line: line)
        return try value.get()
    }

    /// Uses an expectation to wait for the given `publisher`
    /// to send a value but ignores the first value sent.
    /// - Parameters:
    ///   - publisher: The publisher to wait for receiving the value of.
    ///   - performPublish: The action to perform to trigger publishing a value.
    ///   - timeout: The timeout before the test fails.
    ///   - file: File info.
    ///   - line: Line info.
    /// - Returns: The result value if successful; test failure otherwise.
    func waitForValueDropFirst<T: Publisher>(for publisher: T,
                                             publishAction performPublish: () -> Void,
                                             timeout: TimeInterval = XCTestCase.defaultTimeout,
                                             file: StaticString = #filePath,
                                             line: UInt = #line) throws -> T.Output where T.Failure == Never {
        var result: Result<T.Output, Error>?
        let ex = expectation(description: "waitForValue(publisher:)")

        let cancellable = publisher
            .dropFirst() // ignore the initial value
            .sink(receiveValue: { value in
                result = .success(value)
                ex.fulfill()
            })

        performPublish()

        waitForExpectations(timeout: timeout)
        cancellable.cancel()

        let value = try XCTUnwrap(result, "failed: no output from publisher", file: file, line: line)
        return try value.get()
    }

    /// Uses an expectation to wait for the given `publisher` to publish.
    /// - Parameters:
    ///   - publisher: The publisher to wait on.
    ///   - timeout: The timeout before the test fails.
    ///   - file: File info.
    ///   - line: Line info.
    /// - Returns: The result value if successful; test failure otherwise.
    func wait<T: Publisher>(for publisher: T,
                            timeout: TimeInterval = XCTestCase.defaultTimeout,
                            file: StaticString = #filePath,
                            line: UInt = #line) throws -> T.Output {

        var result: Result<T.Output, Error>?
        let ex = expectation(description: "wait(for:)")

        let cancellable = publisher.sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    result = .failure(error)
                case .finished:
                    break
                }

                ex.fulfill()
            },
            receiveValue: { value in
                result = .success(value)
            })

        waitForExpectations(timeout: timeout)
        cancellable.cancel()

        let value = try XCTUnwrap(result, "failed: no output from publisher", file: file, line: line)
        return try value.get()
    }

    /// A default timeout before the expectation fails.
    static var defaultTimeout: TimeInterval {
        2.0
    }
}
