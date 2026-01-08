import Numerics

public struct Octonion<RealType> where RealType: Real & SIMDScalar {
  
  @usableFromInline @inline(__always)
  internal var components: SIMD8<RealType>
  
}

extension Octonion {
  
  @inlinable
  public init(_ components: SIMD8<RealType>) {
      self.components = components
  }

  public static func +(lhs: Octonion, rhs: Octonion) -> Octonion {
    Octonion(lhs.components + rhs.components)
  }

  public static func -(lhs: Octonion, rhs: Octonion) -> Octonion {
    Octonion(lhs.components - rhs.components)
  }

  public static func +=(lhs: inout Octonion, rhs: Octonion) {
    lhs.components += rhs.components
  }

  public static func -=(lhs: inout Octonion, rhs: Octonion) {
    lhs.components -= rhs.components
  }
  
  public static prefix func -(x: Octonion) -> Octonion {
    return Octonion(-x.components)
  }
  
  // component access
    
  public var e0: RealType { return self.components[0] }
  public var e1: RealType { return self.components[1] }
  public var e2: RealType { return self.components[2] }
  public var e3: RealType { return self.components[3] }
  public var e4: RealType { return self.components[4] }
  public var e5: RealType { return self.components[5] }
  public var e6: RealType { return self.components[6] }
  public var e7: RealType { return self.components[7] }

  public subscript(_ index: Int) -> RealType {
    get { components[index] }
    set { components[index] = newValue }
  }
    
  public var real: RealType {
    return self.e0
  }
    
    public var imaginary: (RealType, RealType, RealType, RealType, RealType, RealType, RealType) {
      return (
        self[1],
        self[2],
        self[3],
        self[4],
        self[5],
        self[6],
        self[7]
    )
  }
}
