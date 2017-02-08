import XCTest
@testable import Bytes

class ControlCharacterTests: XCTestCase {
    static let allTests = [
        ("testControlCharacters", testControlCharacters),
        ("testNumberCharacters", testNumberCharacters),
        ("testCRLF", testCRLF),
    ]

    func testControlCharacters() {
        let input: Bytes = [
            .horizontalTab,
            .newLine,
            .carriageReturn,
            .space,
            .exclamation,
            .quote,
            .numberSign,
            .dollar,
            .percent,
            .ampersand,
            .leftParenthesis,
            .rightParenthesis,
            .asterisk,
            .plus,
            .comma,
            .hyphen,
            .period,
            .forwardSlash,
            .backSlash,
            .colon,
            .semicolon,
            .equals,
            .questionMark,
            .at,
            .leftSquareBracket,
            .rightSquareBracket,
            .underscore,
            .tilda
        ]

        let string = "\t\n\r !\"#$%&()*+,-./\\:;=?@[]_~"
        let expectation = Bytes(string.utf8)

        XCTAssertEqual(input, expectation)
    }

    func testNumberCharacters() {
        let input: Bytes = [
            .zero,
            .one,
            .two,
            .three,
            .four,
            .five,
            .six,
            .seven,
            .eight,
            .nine
        ]

        let string = "0123456789"
        let expectation = Bytes(string.utf8)

        XCTAssertEqual(input, expectation)
    }

    func testCRLF() {
        let input: Bytes = Byte.crlf
        XCTAssertEqual(input, "\r\n".makeBytes())
    }
}
