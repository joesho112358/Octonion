import Numerics

extension Octonion {
    public static func CayleyDicksonConstruction(_ lhs: RealType, _ rhs: RealType) -> RealType {
        return lhs * rhs
    }

    public static func CayleyDicksonConstruction(_ lhs: Complex<RealType>, _ rhs: Complex<RealType>) -> Complex<RealType> {
        var r = lhs.real
        var i = lhs.imaginary
        let a = r
        let b = i
        
        r = rhs.real
        i = rhs.imaginary
        let c = r
        let d = i
        
        let real = CayleyDicksonConstruction(a, c) - CayleyDicksonConstruction(d, b)
        let imaginary = CayleyDicksonConstruction(d, a) + CayleyDicksonConstruction(b, c)
        return Complex(real, imaginary)
    }

    public static func CayleyDicksonConstruction(_ lhs: Quaternion<RealType>, _ rhs: Quaternion<RealType>) -> Quaternion<RealType> {
        var r = lhs.real
        var i = lhs.imaginary.x
        var j = lhs.imaginary.y
        var k = lhs.imaginary.z
        let a = Complex(r, i)
        let b = Complex(j, k)
        
        r = rhs.real
        i = rhs.imaginary.x
        j = rhs.imaginary.y
        k = rhs.imaginary.z
        let c = Complex(r, i)
        let d = Complex(j, k)
        
        let left = CayleyDicksonConstruction(a, c) - CayleyDicksonConstruction(d.conjugate, b)
        let right = CayleyDicksonConstruction(d, a) + CayleyDicksonConstruction(b, c.conjugate)
        
        return Quaternion(real: left.real, imaginary: left.imaginary, right.real, right.imaginary)
    }

    public static func CayleyDicksonConstruction(_ lhs: Octonion, _ rhs: Octonion) -> Octonion {
        
        let leftQuaternions = lhs.splitToQuaternions()
        let rightQuaternions = rhs.splitToQuaternions()
        
        let a = leftQuaternions[0]
        let b = leftQuaternions[1]
        let c = rightQuaternions[0]
        let d = rightQuaternions[1]
        
        let left = CayleyDicksonConstruction(a, c) - CayleyDicksonConstruction(d.conjugate, b)
        let right = CayleyDicksonConstruction(d, a) + CayleyDicksonConstruction(b, c.conjugate)
        
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
    
    
  // The intended use for this is the Cayley-Dickson Construction
  internal func splitToQuaternions() -> Array<Quaternion<RealType>> {
    let r1 = self.e0
    let i1 = self.e1
    let j1 = self.e2
    let k1 = self.e3
    
    let r2 = self.e4
    let i2 = self.e5
    let j2 = self.e6
    let k2 = self.e7
    
    return [
      Quaternion(real: r1, imaginary: i1, j1, k1),
      Quaternion(real: r2, imaginary: i2, j2, k2)
    ]
  }
}
