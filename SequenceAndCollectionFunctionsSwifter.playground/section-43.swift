let absolutePathComponents = [ "usr", "local", "bin" ]
let path = reduce(absolutePathComponents, "") { accumulate, component in accumulate + "/" + component }
path
var sum = reduce(oneTwoThree, 0) { a,x in a+x }
sum
// var oneTwoThree = [1,2,3]
reduce(oneTwoThree, 0, +)