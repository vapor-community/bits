import XCTest
@testable import BitsTests

XCTMain([
    testCase(ControlCharacterTests.allTests),
    testCase(BytesTests.allTests),
    testCase(ByteTests.allTests),
    testCase(AlphabetTests.allTests),
    testCase(PatternMatchingTests.allTests),
    testCase(UnsignedIntegerTests.allTests),
])
