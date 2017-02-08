import XCTest
@testable import Bits

class PatternMatchingTests: XCTestCase {
    static let allTests = [
        ("testByteValue", testByteValue),
        ("testBytesSliceValue", testBytesSliceValue),
        ("testBytesValue", testBytesValue),
    ]

    func testByteValue() {
        let value = Byte(8)

        switch value {
        case 8:
            break
        default:
            XCTFail("Individual byte to byte pattern matching failed")
        }

        switch value {
        case ArraySlice(0...10):
            break
        default:
            XCTFail("Individual byte to slice pattern matching failed")
        }

        switch value {
        case Array(0...10):
            break
        default:
            XCTFail("Individual byte to array pattern matching failed")
        }
    }

    func testBytesSliceValue() {
        let value = BytesSlice(0...10)

        switch value {
        case 8:
            break
        default:
            XCTFail("BytesSlice to byte pattern matching failed")
        }

        switch value {
        case ArraySlice(0...10):
            break
        default:
            XCTFail("BytesSlice to slice pattern matching failed")
        }

        switch value {
        case Array(0...10):
            break
        default:
            XCTFail("BytesSlice to array pattern matching failed")
        }
    }

    func testBytesValue() {
        let value = Bytes(0...10)

        switch value {
        case 8:
            break
        default:
            XCTFail("Individual byte to byte pattern matching failed")
        }

        switch value {
        case ArraySlice(0...10):
            break
        default:
            XCTFail("Individual byte to slice pattern matching failed")
        }

        switch value {
        case Array(0...10):
            break
        default:
            XCTFail("Individual byte to array pattern matching failed")
        }
    }
}
