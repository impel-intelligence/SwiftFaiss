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
