import Foundation

extension Sequence where Iterator.Element == Byte {
    public var base64Encoded: Bytes {
        let bytes = Array(self)
        return Base64Encoder.regular.encode(bytes)
    }

    public var base64Decoded: Bytes {
        let bytes = Array(self)
        return Base64Encoder.regular.decode(bytes)
    }
}

extension Sequence where Iterator.Element == Byte {
    public var base64URLEncoded: Bytes {
        let bytes = Array(self)
        return Base64Encoder.url.encode(bytes)
    }

    public var base64URLDecoded: Bytes {
        let bytes = Array(self)
        return Base64Encoder.url.decode(bytes)
    }
}
