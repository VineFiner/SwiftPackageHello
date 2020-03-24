import XCTest
@testable import CFactorial

final class CFactorialTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual("\(CFactorial(5))", "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
