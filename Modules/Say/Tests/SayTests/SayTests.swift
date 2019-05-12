import XCTest
@testable import Say

final class SayTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Say().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
