import XCTest
@testable import Bytes

class AlphabetTests: XCTestCase {
    static let allTests = [
        ("testLowercaseAlphabet", testLowercaseAlphabet),
        ("testUppercaseAlphabet", testUppercaseAlphabet),
        ("testBytesUppercasing", testBytesUppercasing),
        ("testBytesLowercasing", testBytesLowercasing),
    ]

    func testLowercaseAlphabet() {
        let lowercased = "abcdefghijklmnopqrstuvwxyz"
        let expectation = Bytes(lowercased.utf8)

        let alphabet: Bytes = [
            .a, .b, .c, .d, .e, .f, .g, .h, .i, .j, .k, .l, .m, .n, .o, .p, .q, .r,. s, .t, .u, .v, .w, .x, .y, .z
        ]

        XCTAssertEqual(alphabet, expectation)
    }

    func testUppercaseAlphabet() {
        let lowercased = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let expectation = Bytes(lowercased.utf8)

        let alphabet: Bytes = [
            .A, .B, .C, .D, .E, .F, .G, .H, .I, .J, .K, .L, .M, .N, .O, .P, .Q, .R,. S, .T, .U, .V, .W, .X, .Y, .Z
        ]

        XCTAssertEqual(alphabet, expectation)
    }

    func testBytesUppercasing() {
        let hello = "Hello, World!".makeBytes().uppercased.string
        let expectation = "HELLO, WORLD!"
        XCTAssertEqual(hello, expectation)
    }

    func testBytesLowercasing() {
        let hello = "HELLO, WORLD!".makeBytes().lowercased.string
        let expectation = "hello, world!"
        XCTAssertEqual(hello, expectation)
    }
}
