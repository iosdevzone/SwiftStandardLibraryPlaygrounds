let oneToFive = [1,2,3,4,5]
let oneToThree = [1,2,3]
startsWith(oneToFive, oneToThree)

let uppercaseString = "UPPERCASE"
let lowerCasePrefix = "upper"
startsWith(uppercaseString, lowerCasePrefix) { x,y in String(x).lowercaseString == String(y).lowercaseString }
