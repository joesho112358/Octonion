import XCTest
@testable import Octonion

final class OctonionEquatableTests: XCTestCase {
    func testEqual() {
        let o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        let o2 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        
        XCTAssertTrue(o1 == o2)
    }
    
    func testUnequal() {
        let o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        let o2 = Octonion([0, 1, 2, 3, 4, 5, 6, 7])
        
        XCTAssertFalse(o1 == o2)
    }
    
    func testIfZero() {
        let o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        let o2 = Octonion([0, 0, 0, 0, 0, 0, 0, 0])
        
        XCTAssertFalse(o1.isZero)
        XCTAssertTrue(o2.isZero)
    }
}
