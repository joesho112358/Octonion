import Darwin
import Numerics

extension Octonion {

    public var conjugate: Octonion {
      Octonion(from: components * [1, -1, -1, -1, -1, -1, -1, -1])
    }

    public static func *(lhs: Octonion, rhs: Octonion) -> Octonion {
      return CayleyDicksonConstruction(lhs, rhs)
    }

    public static func *= (lhs: inout Octonion, rhs: Octonion) {
      lhs = lhs * rhs
    }
    
    public var norm: RealType {
      (
        self.conjugate * self
      ).e0.squareRoot()
    }
    
    public var inverse: Octonion {
      let conj = self.conjugate
      let norm = self.norm
      let denom = norm * norm
      
      return Octonion([
        conj.e0/denom,
        conj.e1/denom,
        conj.e2/denom,
        conj.e3/denom,
        conj.e4/denom,
        conj.e5/denom,
        conj.e6/denom,
        conj.e7/denom
      ])
    }
}
