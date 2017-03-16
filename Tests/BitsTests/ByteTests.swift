import Foundation
import XCTest
@testable import Bits

class ByteTests: XCTestCase {
    static let allTests = [
        ("testRandom", testRandom),
        ("testIsCases", testIsCases),
        ("testPatternMatching", testPatternMatching),
        ("testBase64", testBase64),
        ("testBase64URL", testBase64URL),
    ]

    func testRandom() {
        var one: [Byte] = []
        var two: [Byte] = []

        for _ in 0..<20 {
            one.append(Byte.random())
            two.append(Byte.random())
        }

        XCTAssert(one != two)
    }

    public func testIsCases() {
        // white space
        XCTAssertEqual(" ".makeBytes().first?.isWhitespace, true)
        XCTAssertEqual("\n".makeBytes().first?.isWhitespace, true)
        XCTAssertEqual("\r".makeBytes().first?.isWhitespace, true)
        XCTAssertEqual("\t".makeBytes().first?.isWhitespace, true)
        XCTAssertEqual("=".makeBytes().first?.isWhitespace, false)

        // letters
        XCTAssertEqual("a".makeBytes().first?.isLetter, true)
        XCTAssertEqual("F".makeBytes().first?.isLetter, true)
        XCTAssertEqual("g".makeBytes().first?.isLetter, true)
        XCTAssertEqual("é".makeBytes().first?.isLetter, false)

        // digits
        for i in 0...9 {
            XCTAssertEqual(i.description.makeBytes().first?.isDigit, true)
            XCTAssertEqual(i.description.makeBytes().first?.isAlphanumeric, true)
        }
        XCTAssertEqual("f".makeBytes().first?.isDigit, false)

        // hex digits
        for character in "0123456789abcdefABCDEF".characters {
            XCTAssertEqual(String(character).makeBytes().first?.isHexDigit, true)
        }
        XCTAssertEqual("g".makeBytes().first?.isHexDigit, false)
    }

    public func testPatternMatching() {
        switch Byte.a {
        case Byte.f:
            XCTFail()
        case Byte.a:
            break
        default:
            XCTFail()
        }
    }

    public func testBase64() {
        XCTAssertEqual(
            "dmFwb3I="
                .makeBytes()
                .base64Decoded
                .makeString(),
            "vapor"
        )
        XCTAssertEqual(
            "⚠️"
                .makeBytes()
                .base64Decoded
                .makeString(),
            ""
        )
        XCTAssertEqual(
            "hello"
                .makeBytes()
                .base64Encoded
                .makeString(),
            "aGVsbG8="
        )

        XCTAssert(
            "eyJleHAiOjE0ODkxNTA1NjIuMjgyODMsInVzZXIiOnsiaWQiOiI3MUUxQjUzQy1BMDZBLTRFMzUtQTBDQy0yQ0UzMUEzQkQ5MDciLCJuYW1lIjoiSm9uYXMgU2Nod2FydHoifX0="
                .makeBytes()
                .base64Decoded
                .last
            != Byte.max
        )
    }

    public func testBase64URL() {
        XCTAssertEqual(
            "dmFwb3I="
                .makeBytes()
                .base64URLDecoded
                .makeString(),
            "vapor"
        )
        XCTAssertEqual(
            "⚠️"
                .makeBytes()
                .base64URLDecoded
                .makeString(),
            ""
        )
        XCTAssertEqual(
            "hello"
                .makeBytes()
                .base64URLEncoded
                .makeString(),
            "aGVsbG8"
        )
        XCTAssertEqual(
            "+/+/"
                .makeBytes()
                .base64Decoded
                .base64URLEncoded
                .makeString(),
            "-_-_"
        )
    }

    public func testHexEncode() {
        XCTAssertEqual(
            "vapor"
                .makeBytes()
                .hexEncoded
                .makeString(),
            "7661706f72"
        )
        XCTAssertEqual(
            "vapor"
                .makeBytes()
                .hexEncoded
                .hexDecoded
                .makeString(),
            "vapor"
        )
    }

    public func testHexCustom() {
        let encoder = HexEncoder(ignoreUndecodableCharacters: false)
        XCTAssertEqual(
            encoder.decode(
                "61616X6161".makeBytes()
            ).makeString(),
            "aa"
        )
    }
}
