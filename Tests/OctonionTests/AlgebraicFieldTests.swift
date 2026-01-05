import XCTest
@testable import Octonion

final class OctonionAlgebraicFieldTests: XCTestCase {
    func testConjugation() {
        let o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        
        XCTAssertEqual(o1.conjugate, Octonion([1, -2, -3, -4, -5, -6, -7, -8]))
    }
    
    func testMultiply() {
        let o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        let o2 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        
        XCTAssertEqual(o1 * o2, Octonion([-202, 4, 6, 8, 10, 12, 14, 16]))
    }
    
    func testMultiplySet() {
        var o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        let o2 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        o1 *= o2
        XCTAssertEqual(o1, Octonion([-202, 4, 6, 8, 10, 12, 14, 16]))
    }
    
    func testNorm() {
        let o1 = Octonion([1, 1, 1, 1, 1, 1, 1, 3])

        XCTAssertEqual(o1.norm, 4)
    }
    
    func testInverse() {
        let o1 = Octonion([1, 1, 1, 1, 1, 1, 1, 3])
        
        let result = o1 * o1.inverse
        XCTAssertEqual(result.e0, 1)
        XCTAssertEqual(result.e1, 0)
        XCTAssertEqual(result.e2, 0)
        XCTAssertEqual(result.e3, 0)
        XCTAssertEqual(result.e4, 0)
        XCTAssertEqual(result.e5, 0)
        XCTAssertEqual(result.e6, 0)
        XCTAssertEqual(result.e7, 0)
    }

}
