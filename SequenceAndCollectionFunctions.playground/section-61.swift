let pathToSplit = "/usr/local/bin"
var splitPath = split(path) { c in c == "/" }
splitPath
splitPath = split(path, { c in c == "/" }, maxSplit:2, allowEmptySlices:true)
splitPath