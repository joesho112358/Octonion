import Numerics

public struct Octonion<RealType> where RealType: Real & SIMDScalar {
  
  @usableFromInline @inline(__always)
  internal var components: SIMD8<RealType>
  
  @usableFromInline @inline(__always)
  internal init(from components: SIMD8<RealType>) {
    self.components = components
  }
  
}

extension Octonion {
  
  @inlinable
  public init(_ components: SIMD8<RealType>) {
    self.init(from: components)
  }

  public static func +(lhs: Octonion, rhs: Octonion) -> Octonion {
    Octonion(lhs.components + rhs.components)
  }

  public static func -(lhs: Octonion, rhs: Octonion) -> Octonion {
    Octonion(lhs.components - rhs.components)
  }

  public static func +=(lhs: inout Octonion, rhs: Octonion) {
    lhs = lhs + rhs
  }

  public static func -=(lhs: inout Octonion, rhs: Octonion) {
    lhs = lhs - rhs
  }
  
  public var e0: RealType {
    return self.components[0]
  }
  
  public var e1: RealType {
    return self.components[1]
  }
  
  public var e2: RealType {
    return self.components[2]
  }
  
  public var e3: RealType {
    return self.components[3]
  }
  
  public var e4: RealType {
    return self.components[4]
  }
  
  public var e5: RealType {
    return self.components[5]
  }
  
  public var e6: RealType {
    return self.components[6]
  }
  
  public var e7: RealType {
    return self.components[7]
  }

}
