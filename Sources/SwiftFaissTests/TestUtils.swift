import Foundation
import XCTest

func matrix(rows: Int, columns: Int) -> [[Float]] {
    var data: [[Float]] = []
    data.reserveCapacity(rows)
    for i in 0 ..< rows {
        data.append((0 ..< columns).map { index in Float(i * columns + index) })
    }
    return data
}

func XCTAssertEqual<T: FloatingPoint>(
    _ expression1: @autoclosure () throws -> [T],
    _ expression2: @autoclosure () throws -> [T],
    accuracy: T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) {
    do {
        let lhsEvaluated = try expression1()
        let rhsEvaluated = try expression2()
        XCTAssertEqual(lhsEvaluated.count, rhsEvaluated.count, file: file, line: line)
        for (lhs, rhs) in zip(lhsEvaluated, rhsEvaluated) {
            XCTAssertEqual(lhs, rhs, accuracy: accuracy, file: file, line: line)
        }
    } catch {
        XCTFail("Unexpected error: \(error)", file: file, line: line)
    }
}

func XCTAssertEqual<T: FloatingPoint>(
    _ expression1: @autoclosure () throws -> [[T]],
    _ expression2: @autoclosure () throws -> [[T]],
    accuracy: T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) {
    do {
        let lhsEvaluated = try expression1()
        let rhsEvaluated = try expression2()
        XCTAssertEqual(lhsEvaluated.count, rhsEvaluated.count, file: file, line: line)
        for (lhs, rhs) in zip(lhsEvaluated, rhsEvaluated) {
            XCTAssertEqual(lhs, rhs, accuracy: accuracy, file: file, line: line)
        }
    } catch {
        XCTFail("Unexpected error: \(error)", file: file, line: line)
    }
}
