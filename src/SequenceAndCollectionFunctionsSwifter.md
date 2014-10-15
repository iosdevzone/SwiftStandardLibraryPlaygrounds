In the last post in this series, I took at look at the protocols that Swift uses to define generators, sequences and collections. In this post I am going to present examples of using the Standard Library Functions that operate on these types. I'll run through them in alphabetical order.

Throughout this post I will use "a `SequenceType`" as a shorthand for "an object conforming to `SequenceType` protocol" and similar shorthand for other type-like protocols.

I have purposely left out the function definitions. In the playground for the post you can option click to see the gory details.

So without further ado let's get going.

## advance
Advances an index by a given number of elements.

```swift
let data = [2.0,4.0,4.0,4.0,5.0,5.0,7.0,9.0]
var seventh = advance(data.startIndex, 6)
data[seventh]
```
<a href="http://swifter.natecook.com/func/advance"><code>advance</code> reference on Swifter</a>
## contains
Determines if a `SequenceType` contains an element
```swift
// let data = [2.0,4.0,4.0,4.0,5.0,5.0,7.0,9.0]
contains(data, 7.0) // true
```
or contains an element that satisfies a predicate
```swift
// let data = [2.0,4.0,4.0,4.0,5.0,5.0,7.0,9.0]
let doesContain = contains(data) { x in x > 8.0 }
doesContain // true
```
<a href="http://swifter.natecook.com/func/contains"><code>contains</code> reference on Swifter</a>
## count
Counts the number of elements in a range
```swift
// let data = [2.0,4.0,4.0,4.0,5.0,5.0,7.0,9.0]
count(data.startIndex..<data.endIndex) // 8
```
<a href="http://swifter.natecook.com/func/count"><code>count</code> reference on Swifter</a>
## countElements
Counts the number of elements in a `CollectionType`
```swift
// let data = [2.0,4.0,4.0,4.0,5.0,5.0,7.0,9.0]
countElements(data) // 8
```
<a href="http://swifter.natecook.com/func/countElements"><code>countElements</code> reference on Swifter</a>
## distance
The distance in elements between two `ForwardIndexTypes`
```swift
// let data = [2.0,4.0,4.0,4.0,5.0,5.0,7.0,9.0]
distance(data.startIndex, data.endIndex) // 8
```
<a href="http://swifter.natecook.com/func/distance"><code>distance</code> reference on Swifter</a>
## dropFirst
Returns the slice obtained by dropping the first element of a sequence
```swift
var oneTwoThree = [1,2,3]
dropFirst(oneTwoThree)
```
<a href="http://swifter.natecook.com/func/dropFirst"><code>dropFirst</code> reference on Swifter</a>
## dropLast
Returns the slice obtained by dropping the first element of a sequence
```swift
// var oneTwoThree = [1,2,3]
dropFirst(oneTwoThree)
```
<a href="http://swifter.natecook.com/func/dropLast"><code>dropLast</code> reference on Swifter</a>
## enumerate
```swift
// var oneTwoThree = [1,2,3]
println("enumerate")
for (pos,value) in enumerate(oneTwoThree) {
    println("\(pos): \(value)")
}
```
Prints
```
0: 1
1: 2
2: 3
```
<a href="http://swifter.natecook.com/func/enumerate"><code>enumerate</code> reference on Swifter</a>
## equal
Tests two sequences for equality
```swift
// var oneTwoThree = [1,2,3]
let fourFive = [4,5]
equal(oneTwoThree, fourFive)
```
<a href="http://swifter.natecook.com/func/equal"><code>equal</code> reference on Swifter</a>
## extend
Extends a mutable sequence
```swift
// var oneTwoThree = [1,2,3]
extend(&oneTwoThree, fourFive)
oneTwoThree // after [1,2,3,4,5]
```
<a href="http://swifter.natecook.com/func/extend"><code>extend</code> reference on Swifter</a>
## filter
Filters a sequence based on a predicate
```swift
oneTwoThree  // before [1,2,3,4,5] from previous section
oneTwoThree = filter(oneTwoThree) { x in x <= 3 }
oneTwoThree  // after [1,2,3] 
```
<a href="http://swifter.natecook.com/func/filter"><code>filter</code> reference on Swifter</a>
## first
Returns the first element of a collection
```swift
// var oneTwoThree = [1,2,3]
first(oneTwoThree) // {Some 1}
var e = [Int]()
first(e) // nil
```
<a href="http://swifter.natecook.com/func/first"><code>first</code> reference on Swifter</a>
## indices
Returns the range of valid indices for a collection
```swift
// var oneTwoThree = [1,2,3]
indices(oneTwoThree)
```
<a href="http://swifter.natecook.com/func/indices"><code>indices</code> reference on Swifter</a>
## insert
Inserts a new element into a `RangeReplaceableCollectionType`
```swift
// var oneTwoThree = [1,2,3]
var zeroOneTwoThree = oneTwoThree
insert(&zeroOneTwoThree, 0, atIndex:0)
```
<a href="http://swifter.natecook.com/func/insert"><code>insert</code> reference on Swifter</a>
## isEmpty
Returns true if a collection contains no elements
```swift
// var zeroOneTwoThree = oneTwoThree
isEmpty("") // true
isEmpty([Int]()) // true
isEmpty(zeroOneTwoThree) // false
```
<a href="http://swifter.natecook.com/func/isEmpty"><code>isEmpty</code> reference on Swifter</a>
## join
Returns a collection formed by placing a separator between each element of a sequence
```swift
let relativePathComponents = [ "~", "src", "IDZAQAudioPlayer" ]
join("/", relativePathComponents)
```
<a href="http://swifter.natecook.com/func/join"><code>join</code> reference on Swifter</a>
## last
Returns the last element of a collection (with a BidirectionalIndexType) or nil
```swift
// var oneTwoThree = [1,2,3]
last(oneTwoThree) // 3
```
<a href="http://swifter.natecook.com/func/last"><code>last</code> reference on Swifter</a>
## lazy
Will be handled in a future post

## map
Returns the array generated by applying a function to each element of an array
```swift
// var zeroOneTwoThree = [0,1,2,3]
var mapResult = map(zeroOneTwoThree) { x in x * x }
mapResult // [1,4,9]
```
<a href="http://swifter.natecook.com/func/map"><code>map</code> reference on Swifter</a>
## maxElement
Returns the maximum element of a sequence
```swift
// var zeroOneTwoThree = [0,1,2,3]
maxElement(zeroOneTwoThree) //3
```
<a href="http://swifter.natecook.com/func/maxElement"><code>maxElement</code> reference on Swifter</a>
## minElement
Return the minimum element of a sequence
```swift
// var zeroOneTwoThree = [0,1,2,3]
minElement(zeroOneTwoThree) //0
```
<a href="http://swifter.natecook.com/func/minElement"><code>minElement</code> reference on Swifter</a>
## prefix
Will be handled in a future post. Operates on a Sliceable.

## reduce
Accumulates the result of a function on each element of sequence
```swift
let absolutePathComponents = [ "usr", "local", "bin" ]
let path = reduce(absolutePathComponents, "") { accumulate, component in accumulate + "/" + component }
path
var sum = reduce(oneTwoThree, 0) { a,x in a+x }
sum
// var oneTwoThree = [1,2,3]
reduce(oneTwoThree, 0, +)
```
<a href="http://swifter.natecook.com/func/reduce"><code>reduce</code> reference on Swifter</a>
## removeAll
Remove all elements from a `RangeReplaceableCollectionType`, optionally requesting the storage capacity be preserved.
```swift
// var zeroOneTwoThree = [0,1,2,3]
removeAll(&zeroOneTwoThree, keepCapacity: true)
zeroOneTwoThree.capacity
```
<a href="http://swifter.natecook.com/func/removeAll"><code>removeAll</code> reference on Swifter</a>
## removeAtIndex
Remove and return an element from a `RangeReplaceableCollectionType`
```swift
zeroOneTwoThree = [0,1,2,3]
removeAtIndex(&zeroOneTwoThree, 2) //2
zeroOneTwoThree // [0,1,3]
```
<a href="http://swifter.natecook.com/func/removeAtIndex"><code>removeAtIndex</code> reference on Swifter</a>
## removeLast
Remove and return the last element from a nonempty `RangeReplaceableCollectionType`
```swift
zeroOneTwoThree = [0,1,2,3]
removeLast(&zeroOneTwoThree)
```
<a href="http://swifter.natecook.com/func/removeLast"><code>removeLast</code> reference on Swifter</a>
## removeRange
Remove elements within a specified index range
```swift
zeroOneTwoThree = [0,1,2,3]
removeRange(&zeroOneTwoThree, 1...2)
```
<a href="http://swifter.natecook.com/func/removeRange"><code>removeRange</code> reference on Swifter</a>
## reverse
Reverses a `CollectionType` with an index conforming to `BidirectionalIndexType`
```swift
zeroOneTwoThree = [0,1,2,3]
var threeTwoOneZero = reverse(zeroOneTwoThree)
```
<a href="http://swifter.natecook.com/func/reverse"><code>reverse</code> reference on Swifter</a>
## sort
Sorts a mutable collection in place using the < operator or a user supplied comparison function.
```swift
threeTwoOneZero // [3,2,1,0]
sort(&threeTwoOneZero)
threeTwoOneZero // [0,1,2,3]
sort(&threeTwoOneZero) { x,y in x>y }
```
<a href="http://swifter.natecook.com/func/sort"><code>sort</code> reference on Swifter</a>
## sorted
Returns the `Array` obtained by sorting a `SequenceType` using the < operator or a user supplied comparison function.
```swift
let random = [1,6,2,8,3,3,2,8,7]
let randomSortedAscending = sorted(random)
let randomSortedDescending = sorted(random) { x,y in x>y }
randomSortedDescending
```
<a href="http://swifter.natecook.com/func/sorted"><code>sorted</code> reference on Swifter</a>
## splice
Inserts the elements of a collection into a `RangeReplaceableCollectionType` at a given index.
```swift
var gap = [0,1,2,7,8,9]
var missing = [3,4,5,6]
splice(&gap, missing, atIndex:3)
```
<a href="http://swifter.natecook.com/func/splice"><code>splice</code> reference on Swifter</a>
## split
```swift
let pathToSplit = "/usr/local/bin"
var splitPath = split(path) { c in c == "/" }
splitPath
splitPath = split(path, { c in c == "/" }, maxSplit:2, allowEmptySlices:true)
splitPath
```
<a href="http://swifter.natecook.com/func/split"><code>split</code> reference on Swifter</a>
## startsWith
Determines if the prefix of one `SequenceType` is equivalent to another `SequenceType` either using the == operator or a user defined equivalence function
```swift
let oneToFive = [1,2,3,4,5]
let oneToThree = [1,2,3]
startsWith(oneToFive, oneToThree)

let floats125 = [1.0,2.0,3.0,4.0,5.0]
let fuzzyPrefix = [1.01,1.99,3.01]
let isFuzzyPrefix = startsWith(floats125, fuzzyPrefix) { x,y in abs(x-y) < 0.02 }
isFuzzyPrefix
```
<a href="http://swifter.natecook.com/func/startsWith"><code>startsWith</code> reference on Swifter</a>
## stride
Creates sequences from a given value, to or through a given value, steping by a given increment (or stride).
```swift
let to = stride(from:0, to:100, by:10)
map(to) { x in println(x) }
let through = stride(from:0, through:100, by:10)
map(through) { x in println(x) }
```
<a href="http://swifter.natecook.com/func/stride"><code>stride</code> reference on Swifter</a>
## underestimateCount
Will be covered in a future post.

## Download the Playground
The playground for this, and all other posts in the series, can be found on GitHub in the <a href="http://bit.ly/Z2gI5v" title="SwiftStandardLibraryPlaygrounds">SwiftStandardLibraryPlaygrounds</a> repository.

