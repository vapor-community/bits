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

    func testConversionsConsistent() {
        let int32BytesExpectation = [0x00, 0x00, 0xFF, 0x64] as Bytes
        let int32 = UInt32(bytes: int32BytesExpectation)
        let int32Expectation = UInt32(0x00_00_FF_64)
        XCTAssertEqual(int32, int32Expectation)

        let int32Bytes = int32.makeBytes()
        XCTAssertEqual(int32Bytes, int32BytesExpectation)

        let int16 = UInt16(int32)
        let int16Expectation = UInt16(0xFF_64)
        XCTAssertEqual(int16, int16Expectation)

        let int16BytesExpectation = [0xFF, 0x64] as Bytes
        let int16Bytes = int16.makeBytes()
        XCTAssertEqual(int16Bytes, int16BytesExpectation)

        let int16System = UInt16(int32)
        let int16FromOverflow = UInt16(bytes: int32Bytes)
        XCTAssertEqual(int16FromOverflow, int16System)
    }
}
