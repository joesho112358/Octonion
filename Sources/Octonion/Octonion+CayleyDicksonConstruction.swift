import Numerics

public protocol CayleyDicksonAlgebra: Equatable {
    associatedtype RealType

    var conjugate: Self { get }
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
}

extension Complex: CayleyDicksonAlgebra where RealType: Real & SIMDScalar {
    @inlinable public var conjugate: Complex<RealType> {
        Complex(real, -imaginary)
    }
}

extension Quaternion: CayleyDicksonAlgebra where RealType: Real & SIMDScalar {
    @inlinable public var conjugate: Quaternion<RealType> {
        Quaternion(real:  real,
                   imaginary: SIMD3(-imaginary.x, -imaginary.y, -imaginary.z))
    }
}

extension Octonion {
    
    private static func cdMultiply
        (_ a: RealType, _ b: RealType, _ c: RealType, _ d: RealType) -> (RealType, RealType)
    {
        let left = a * c - d * b
        let right = d * a + b * c
        return (left, right)
    }
    
    private static func cdMultiply<T: CayleyDicksonAlgebra>
        (_ a: T, _ b: T, _ c: T, _ d: T) -> (T, T)
    {
        let left = a * c - d.conjugate * b
        let right = d * a + b * c.conjugate
        return (left, right)
    }

    public static func CayleyDicksonConstruction(_ lhs: Complex<RealType>, _ rhs: Complex<RealType>) -> Complex<RealType> {
        let a = lhs.real
        let b = lhs.imaginary

        let c = rhs.real
        let d = rhs.imaginary
        
        let (left, right) = cdMultiply(a, b, c, d)
        return Complex(left, right)
    }

    public static func CayleyDicksonConstruction(_ lhs: Quaternion<RealType>, _ rhs: Quaternion<RealType>) -> Quaternion<RealType> {
        let a = Complex(lhs.real, lhs.imaginary.x)
        let b = Complex(lhs.imaginary.y, lhs.imaginary.z)

        let c = Complex(rhs.real, rhs.imaginary.x)
        let d = Complex(rhs.imaginary.y, rhs.imaginary.z)
        
        let (left, right) = cdMultiply(a, b, c, d)
        
        return Quaternion(
            real: left.real,
            imaginary: SIMD3(left.imaginary, right.real, right.imaginary)
        )
    }

    public static func CayleyDicksonConstruction(_ lhs: Octonion, _ rhs: Octonion) -> Octonion {
        let a = Quaternion(real: lhs.e0, imaginary: lhs.e1, lhs.e2, lhs.e3)
        let b = Quaternion(real: lhs.e4, imaginary: lhs.e5, lhs.e6, lhs.e7)
        
        let c = Quaternion(real: rhs.e0, imaginary: rhs.e1, rhs.e2, rhs.e3)
        let d = Quaternion(real: rhs.e4, imaginary: rhs.e5, rhs.e6, rhs.e7)
        
        let (left, right) = cdMultiply(a, b, c, d)
        
        return Octonion([
            left.real,
            left.imaginary.x,
            left.imaginary.y,
            left.imaginary.z,
            right.real,
            right.imaginary.x,
            right.imaginary.y,
            right.imaginary.z
        ])
    }
}
