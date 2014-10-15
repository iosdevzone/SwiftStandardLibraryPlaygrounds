let absolutePathComponents = [ "usr", "local", "bin" ]
let path = reduce(absolutePathComponents, "") { accumulate, component in accumulate + "/" + component }
path
var sum = reduce(oneTwoThree, 0) { a,x in a+x }
sum
reduce(oneTwoThree, 0, +)
