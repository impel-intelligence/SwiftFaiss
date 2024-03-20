import SwiftFaissC

enum IOError: Error {
    case creationFailed
}

public enum IOFlag {
    case mmap
    case readOnly

    var faissIOFlag: Int32 {
        switch self {
        case .mmap:
            FAISS_IO_FLAG_MMAP
        case .readOnly:
            FAISS_IO_FLAG_READ_ONLY
        }
    }
}

public func loadFromFile<T: BaseIndex>(_ fileName: String, ioFlag: IOFlag = .readOnly) throws -> T {
    let indexPtr = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
    defer { indexPtr.deallocate() }
    try IndexError.check(
        faiss_read_index_fname(fileName, ioFlag.faissIOFlag, indexPtr)
    )
    
    let index = T.from(IndexPointer(indexPtr.pointee!))
    guard let index else {
        throw IOError.creationFailed
    }
    
    return index
}
