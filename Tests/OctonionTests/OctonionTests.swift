import XCTest
@testable import Octonion

final class OctonionTests: XCTestCase {
    func testAddition() throws {
        let o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        let o2 = Octonion([0, 1, 2, 3, 4, 5, 6, 7])
        
        XCTAssertEqual(o1 + o2, Octonion([1, 3, 5, 7, 9, 11, 13, 15]))
    }
    
    func testAdditionAndSet() throws {
        var o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        let o2 = Octonion([0, 1, 2, 3, 4, 5, 6, 7])
        
        o1 += o2
        
        XCTAssertEqual(o1, Octonion([1, 3, 5, 7, 9, 11, 13, 15]))
    }
    
    func testSubtraction() throws {
        let o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        let o2 = Octonion([0, 1, 2, 3, 4, 5, 6, 7])
        
        XCTAssertEqual(o1 - o2, Octonion([1, 1, 1, 1, 1, 1, 1, 1]))
    }
    
    func testSubtractionAndSet() throws {
        var o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        let o2 = Octonion([0, 1, 2, 3, 4, 5, 6, 7])
        
        o1 -= o2
        
        XCTAssertEqual(o1, Octonion([1, 1, 1, 1, 1, 1, 1, 1]))
    }
    
    func testNegation() throws {
        let o1 = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        
        XCTAssertEqual(-o1, Octonion([-1, -2, -3, -4, -5, -6, -7, -8]))
    }
}
