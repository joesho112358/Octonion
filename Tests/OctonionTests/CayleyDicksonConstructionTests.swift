import XCTest
import Numerics
@testable import Octonion

final class CayleyDicksonConstructionTests: XCTestCase {

    func testReals() throws {
        let x = Octonion.CayleyDicksonConstruction(5.0, 9.0)
        XCTAssertEqual(x, 45.0)
    }

    func testComplex() throws {
        let x = Octonion.CayleyDicksonConstruction(Complex(1, 10), Complex(4, 5))
        XCTAssertEqual(x, Complex(1, 10) * Complex(4, 5))
    }

    func testQuaternion() throws {
        let x = Octonion.CayleyDicksonConstruction(
            Quaternion(real: 1, imaginary: 0, 1, 0),
            Quaternion(real: 1, imaginary: 0.5, 0.5, 0.75)
        )
        XCTAssertEqual(x,
                       Quaternion(real: 1, imaginary: 0, 1, 0) * Quaternion(real: 1, imaginary: 0.5, 0.5, 0.75))
        
        let y = Octonion.CayleyDicksonConstruction(
            Quaternion(real: 1, imaginary: 2, 3, 4),
            Quaternion(real: 5, imaginary: 6, 7, 8)
        )
        XCTAssertEqual(y,
                       Quaternion(real: 1, imaginary: 2, 3, 4) * Quaternion(real: 5, imaginary: 6, 7, 8))

        let z = Octonion.CayleyDicksonConstruction(
            Quaternion(real: -1, imaginary: -1, -1, -1),
            Quaternion(real: 1, imaginary: 1, 1, 1)
        )
        XCTAssertEqual(z,
                       Quaternion(real: -1, imaginary: -1, -1, -1) * Quaternion(real: 1, imaginary: 1, 1, 1))
    }

    func testOctonion() throws {
        let x = Octonion.CayleyDicksonConstruction(
            Octonion([1, 1, 1, 1, 1, 1, 1, 1]),
            Octonion([1, 2, 3, 4, 5, 6, 7, 8])
        )
        XCTAssertEqual(x,
                       Octonion([-34, 4, 6, 8, -6, 8, 14, 8]))
    }

}
