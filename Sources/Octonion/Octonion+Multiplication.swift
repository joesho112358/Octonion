import Numerics

extension Octonion {

    private static func multiplicationTable() -> Dictionary<Int, Dictionary<Int, (Int, Int)>>
    {
        // table returns table of values where the first dict is the first component
        // multiplied by the second component found in the underlying dict which is
        // associated with a tuple of sign and location for the result
        // Example:
        // multiplicationTable()[2][5] => (-1, 3)
        // =>  e2 * e5 = -e3
        // Source for table: https://math.ucr.edu/home/baez/octonions/node3.html
        //          e_1     e_2     e_3     e_4     e_5     e_6     e_7
        //  e_1     -1      e_4     e_7     -e_2    e_6     -e_5    -e_3
        //  e_2     -e_4    -1      e_5     e_1     -e_3    e_7     -e_6
        //  e_3     -e_7    -e_5    -1      e_6     e_2     -e_4    e_1
        //  e_4     e_2     -e_1    -e_6    -1      e_7     e_3     -e_5
        //  e_5     -e_6    e_3     -e_2    -e_7    -1      e_1     e_4
        //  e_6     e_5     -e_7    e_4     -e_3    -e_1    -1      e_2
        //  e_7     e_3     e_6     -e_1    e_5     -e_4    -e_2    -1
        return [
            1: [
                2: (1, 4),
                3: (1, 7),
                4: (-1, 2),
                5: (1, 6),
                6: (-1, 5),
                7: (-1, 3)
            ],
            2: [
                1: (-1, 4),
                3: (1, 5),
                4: (1, 1),
                5: (-1, 3),
                6: (1, 7),
                7: (-1, 6)
            ],
            3: [
                1: (-1, 7),
                2: (-1, 5),
                4: (1, 6),
                5: (1, 2),
                6: (-1, 4),
                7: (1, 1)
            ],
            4: [
                1: (1, 2),
                2: (-1, 1),
                3: (-1, 6),
                5: (1, 7),
                6: (1, 3),
                7: (-1, 5)
            ],
            5: [
                1: (-1, 6),
                2: (1, 3),
                3: (-1, 2),
                4: (-1, 7),
                6: (1, 1),
                7: (1, 4)
            ],
            6: [
                1: (1, 5),
                2: (-1, 7),
                3: (1, 4),
                4: (-1, 3),
                5: (-1, 1),
                7: (1, 2)
            ],
            7: [
                1: (1, 3),
                2: (1, 6),
                3: (-1, 1),
                4: (1, 5),
                5: (-1, 4),
                6: (-1, 2)
            ]
        ]
    }
    
    enum InputError: Error { case not_found }
    
    public func multiplication(_ rhs: Octonion) throws -> Octonion {
        let table = Octonion.multiplicationTable()
        var result = Octonion([self[0] * rhs[0], 0, 0, 0, 0, 0, 0, 0])
        
        for n in 1...7 {
            result[n] += self[0] * rhs[n] + self[n] * rhs[0]
            for m in 1...7 {
                if n == m {
                    result[0] -= self[n] * rhs[m]
                } else {
                    let (sign, location) = table[n]?[m] ?? (0,0)
                    if sign == 0 {
                        throw InputError.not_found
                    }
                    result[location] += RealType(sign) * self[n] * rhs[m]
                }
            }
        }
        return result
    }
}
