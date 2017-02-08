import Foundation
import XCTest
@testable import Bits

class UnsignedIntegerTests: XCTestCase {
    static let allTests = [
        ("testMask", testMask),
        ("testShiftLeft", testShiftLeft),
        ("testShiftRight", testShiftRight),
    ]

    func testMask() {
        let flags: UInt = 0x01 | 0x04

        XCTAssertEqual(flags.containsMask(0x04), true)
        XCTAssertEqual(flags.containsMask(0x01), true)
        XCTAssertEqual(flags.containsMask(0x02), false)
    }

    func testShiftLeft() {
        var value: UInt32 = 0b1111_1111
        value.shiftLeft(4)
        XCTAssertEqual(value, 0b1111_1111_0000)
    }

    func testShiftRight() {
        var value: UInt32 = 0b1111_1111_0000
        value.shiftRight(2)
        XCTAssertEqual(value, 0b0011_1111_1100)
    }

    func testMakeBytes() {
        let value: UInt64 = 0xFF
        let bytes = value.makeBytes()
        XCTAssertEqual(bytes, [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff])
    }
}
