#if os(Linux)
    @_exported import Glibc
#else
    @_exported import Darwin.C
#endif

extension Byte {
    private static let max32 = UInt32(Byte.max)

    public static func random() -> Byte {
        #if os(Linux)
            let val = Byte(libc.random() % Int(max32))
        #else
            let val = Byte(arc4random_uniform(max32))
        #endif
        return val
    }
}
