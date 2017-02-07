import XCTest
@testable import bytes

class bytesTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(bytes().text, "Hello, World!")
    }


    static var allTests : [(String, (bytesTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
