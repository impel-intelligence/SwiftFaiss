import SwiftFaissC

public final class IndexIVFFlat: BaseIndex {
    public internal(set) var indexPointer: IndexPointer

    deinit {
        if isKnownUniquelyReferenced(&indexPointer) {
            faiss_IndexIVFFlat_free(indexPointer.pointer)
        }
    }

    init(indexPointer: IndexPointer) {
        self.indexPointer = indexPointer
    }

    static func from(pointer: IndexPointer) -> IndexIVFFlat? {
        faiss_IndexIVFFlat_cast(pointer.pointer) == nil ? nil : IndexIVFFlat(indexPointer: pointer)
    }

    public convenience init(quantizer: Index, d: Int, nlist: Int) throws {
        let indexPtr = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
        defer { indexPtr.deallocate() }
        try IndexError.check(
            faiss_IndexIVFFlat_new_with(
                indexPtr,
                quantizer.indexPointer.pointer,
                d,
                nlist
            )
        )
        self.init(indexPointer: IndexPointer(indexPtr.pointee!))
    }

    public convenience init(quantizer: Index, d: Int, nlist: Int, metricType: MetricType) throws {
        let indexPtr = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
        defer { indexPtr.deallocate() }
        try IndexError.check(
            faiss_IndexIVFFlat_new_with_metric(
                indexPtr,
                quantizer.indexPointer.pointer,
                d,
                nlist,
                metricType.faissMetricType
            )
        )
        self.init(indexPointer: IndexPointer(indexPtr.pointee!))
    }

    public var nprobe: Int {
        get {
            Int(faiss_IndexIVFFlat_nprobe(indexPointer.pointer))
        }
        set {
            faiss_IndexIVFFlat_set_nprobe(indexPointer.pointer, newValue)
        }
    }

    public var nlist: Int {
        Int(faiss_IndexIVFFlat_nlist(indexPointer.pointer))
    }
}