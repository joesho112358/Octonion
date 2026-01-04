import Darwin
import Numerics

extension Octonion {

    public var conjugate: Octonion {
      let signMask = SIMD8<RealType>(1, -1, -1, -1, -1, -1, -1, -1)
      return Octonion(components * signMask)
    }

    public static func *(lhs: Octonion, rhs: Octonion) -> Octonion {
      return CayleyDicksonConstruction(lhs, rhs)
    }

    public static func *= (lhs: inout Octonion, rhs: Octonion) {
      lhs = lhs * rhs
    }
    
    public var norm: RealType {
      let squared = (self.conjugate * self).e0
      return RealType.sqrt(squared)
    }
    
    public var inverse: Octonion {
      precondition(norm != 0, "No inverse if norm is 0")
      let conj = self.conjugate
      let denom = self.norm * self.norm
      
      return Octonion(SIMD8(
        conj.e0/denom,
        conj.e1/denom,
        conj.e2/denom,
        conj.e3/denom,
        conj.e4/denom,
        conj.e5/denom,
        conj.e6/denom,
        conj.e7/denom
      ))
    }
}
