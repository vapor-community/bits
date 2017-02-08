import Foundation

extension Sequence where Iterator.Element == Byte {
    /**
        Converts a sequence of bytes into a base64 string representation
    */
    public var base64String: String {
        return data.base64EncodedString()
    }

    /**
        Converts a sequence of bytes into a byte array complient w/ base64 encoding
    */
    public var base64Data: Bytes {
        let encodedData = data.base64EncodedData()
        return encodedData.makeBytes()
    }

    private var data: Data {
        let bytes = [Byte](self)
        return Data(bytes: bytes)
    }
}

extension String {
    /**
        Converts a base64 string to its original representation
    */
    public var base64DecodedString: String {
        return base64DecodedData.string
    }

    /**
        Decodes a base64 string to its original data representation
    */
    public var base64DecodedData: Bytes {
        guard let data = NSData(base64Encoded: self, options: []) else { return [] }
        var bytes = Bytes(repeating: 0, count: data.length)
        data.getBytes(&bytes,  length: data.length)
        return bytes
    }
}
