import XCTest
@testable import Octonion

final class OctonionTests: XCTestCase {
    func testAddition() {
        let o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        let o2 = Octonion([0, 1, 2, 3, 4, 5, 6, 7])
        
        XCTAssertEqual(o1 + o2, Octonion([1, 3, 5, 7, 9, 11, 13, 15]))
    }
    
    func testAdditionAndSet() {
        var o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        let o2 = Octonion([0, 1, 2, 3, 4, 5, 6, 7])
        
        o1 += o2
        
        XCTAssertEqual(o1, Octonion([1, 3, 5, 7, 9, 11, 13, 15]))
    }
    
    func testSubtraction() {
        let o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        let o2 = Octonion([0, 1, 2, 3, 4, 5, 6, 7])
        
        XCTAssertEqual(o1 - o2, Octonion([1, 1, 1, 1, 1, 1, 1, 1]))
    }
    
    func testSubtractionAndSet() {
        var o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        let o2 = Octonion([0, 1, 2, 3, 4, 5, 6, 7])
        
        o1 -= o2
        
        XCTAssertEqual(o1, Octonion([1, 1, 1, 1, 1, 1, 1, 1]))
    }
    
    func testNegation() {
        let o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        
        XCTAssertEqual(-o1, Octonion([-1, -2, -3, -4, -5, -6, -7, -8]))
    }
    
    func testAccess() {
        let o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        
        XCTAssertEqual(o1[0], o1.e0)
        XCTAssertEqual(o1[1], o1.e1)
        XCTAssertEqual(o1[2], o1.e2)
        XCTAssertEqual(o1[3], o1.e3)
        XCTAssertEqual(o1[4], o1.e4)
        XCTAssertEqual(o1[5], o1.e5)
        XCTAssertEqual(o1[6], o1.e6)
        XCTAssertEqual(o1[7], o1.e7)
    }
    
    func testUpdating() {
        var o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        let o2 = Octonion([0, 1, 2, 3, 4, 5, 6, 7])
        
        o1[0] -= 1
        XCTAssertEqual(o1.e0, o2.e0)
    }
}
