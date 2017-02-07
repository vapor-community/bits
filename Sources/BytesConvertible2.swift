/**
    Used for objects that can be represented as Bytes
*/
public protocol BytesRepresentable {
    func makeBytes() throws -> Bytes
}

/**
    Used for objects that can be initialized with Bytes
*/
public protocol BytesInitializable {
    init(bytes: Bytes) throws
}

/**
    Used for objects that can be initialized with, and represented by, Bytes
*/
public protocol BytesConvertible: BytesRepresentable, BytesInitializable { }


extension String: BytesConvertible {
    /**
        UTF8 Array representation of string
    */
    public func makeBytes() -> Bytes {
        return Bytes(utf8)
    }

    /**
        Initializes a string with a UTF8 byte array
    */
    public init(bytes: Bytes) {
        self = bytes.string
    }
}

import Foundation

extension Data: BytesConvertible {
    public func makeBytes() throws -> Bytes {
        var array = Bytes(repeating: 0, count: count)
        let buffer = UnsafeMutableBufferPointer(start: &array, count: count)
        _ = copyBytes(to: buffer)
        return array
    }
}
