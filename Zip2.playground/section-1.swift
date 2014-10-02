
// String example
var vs = [ "hablo", "hablas", "habla", "hablamos", "habláis", "hablan" ]
let ps = [ "yo", "tú", "él/ella", "nosotros", "vosotros", "ellos/ellas"]

let pv = map(Zip2(ps, vs)) { "\($0) \($1)" }
pv

// Numerical example
var v1 = [ 1.0, 2.0, 3.0 ]
var v2 = [ 3.0, 2.0, 1.0 ]

func dot(v1 : [Double], v2: [Double]) -> Double {
    return map(Zip2(v1,v2), *).reduce(0.0, +)
}

dot(v1, v2)























