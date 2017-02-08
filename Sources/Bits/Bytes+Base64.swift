import Foundation

extension Sequence where Iterator.Element == Byte {
    public var base64Encoded: Bytes {
        let bytes = [Byte](self)
        let data = Data(bytes: bytes)

        let encodedData = data.base64EncodedData()
        return encodedData.makeBytes()
    }

    public var base64Decoded: Bytes {
        let bytes = [Byte](self)
        let dataBase64 = Data(bytes: bytes)
        guard let dataDecoded = Data(base64Encoded: dataBase64) else {
            return []
        }
        return dataDecoded.makeBytes()
    }
}
