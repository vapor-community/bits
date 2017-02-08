import XCTest
@testable import Bytes

class ControlCharacterTests: XCTestCase {
    static let allTests = [
        ("testControlCharacters", testControlCharacters),
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


//
//
//
//extension Byte {
//    /**
//     Defines the `crlf` used to denote
//     line breaks in HTTP.
//     */
//    public static let crlf: Bytes = [
//        .carriageReturn,
//        .newLine
//    ]
//}
//
//public func ~=(pattern: Byte, value: Byte) -> Bool {
//    return pattern == value
//}
//
//extension Byte {
//    public var isWhitespace: Bool {
//        return self == .space || self == .newLine || self == .carriageReturn || self == .horizontalTab
//    }
//
//    public var isLetter: Bool {
//        return (.a ... .z).contains(self) || (.A ... .Z).contains(self)
//    }
//
//    public var isDigit: Bool {
//        return (.zero ... .nine).contains(self)
//    }
//
//    public var isAlphanumeric: Bool {
//        return isLetter || isDigit
//    }
//
//    public var isHexDigit: Bool {
//        return (.zero ... .nine).contains(self) || (.A ... .F).contains(self) || (.a ... .f).contains(self)
//    }
//}
//
