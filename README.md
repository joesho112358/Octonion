# Octonion

### Intro

```swift
import Octonion

// z = 1*e0 + 2*e1 + 3*e2 + 4*e3 + 5*e4 + 6*e5 + 7*e6 + 8*e7  
let y = Octonion([1, 2, 3, 4, 5, 6, 7, 8])
let z = Octonion([1, 2, 3, 4, 5, 6, 7, 8])

Octonion.CayleyDicksonConstruction(y, z)
```

Octonion.CayleyDicksonConstruction works with Quaternion, Complex, and RealType from Numerics, as well.

For reference: https://en.wikipedia.org/wiki/Octonion
