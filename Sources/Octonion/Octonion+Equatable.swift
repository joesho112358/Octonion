extension Octonion: Equatable {

    static public func ==(o1: Octonion, o2: Octonion) -> Bool {
        return o1.components == o2.components
    }
    
    public var isZero: Bool {
      components == .zero
    }
}
