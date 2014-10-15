# Swift Standard Library: Generators, Sequences and Collections

A large part of the Swift Standard Library is concerned with `Generators`, `Sequences` and `Collections`, so it's pretty important to have a good understanding of them. 

## Generators 

A `Generator` is anything that conforms to the `GeneratorType` protocol.
It's fairly simple. (It's commented out to avoid duplication.)
```swift
/* 
protocol GeneratorType {
  typealias Element
  mutating func next() -> Element?
}
*/
```
So a generator is simply something that can give you the next element of some sequence of elements. If there is no next element it returns `nil`.

With this information, we could create a generator, say, of powers of two.

```swift
import UIKit

/* convenience function */
func pow2(power: Int) -> Int
{
  return Int(pow(2.0, Double(power)))
}

struct PowersOfTwoGenerator1 : GeneratorType {
  typealias Element = Int
  var power : Int = 0
  mutating func next() -> Element?
  {
    return pow2(power++)
  }
}
```
This code conforms to the protocol and is a valid `GeneratorType` but it is not very easy to use. It will produce an infinite number of elements, without external logic.

For example, to print the first 10 powers we would need to do the following:

```swift
var n=10 
var g = PowersOfTwoGenerator1()
while n-- > 0 {
  println(g.next()!)
}
```
We can make it a little easier to use by adding an initializer to set a limit
on how many values we will print.

```swift
struct PowersOfTwoGenerator2 : GeneratorType {
    typealias Element = Int
    var power : Int = 0
    let endPower : Int
    init(end : Int)
    {
        endPower = end
    }
    mutating func next() -> Element?
    {
        return (power < endPower) ? pow2(power++) : nil
    }
}
```
This version is much easier to use.
```swift
var g2 = PowersOfTwoGenerator2(end:10)
while let x = g2.next() {
    println(x)
}
```
OK, so now that we have a generator what can we do with it? Well the answer to
that is... not very much. Very few of the Standard Library Routines take a `GeneratorType` directly; they require a sequence.

## Sequences

A sequence is anything that conforms to the `SequenceType` protocol. It's defined as:
```swift
/*
protocol SequenceType : _Sequence_Type {
    typealias Generator : GeneratorType
    func generate() -> Generator
}
*/
```
Essentially a sequence is a generator factory; something that knows how to make
generators for a sequence.

A first attempt at a power of 2 sequence might look something like this.
```swift
struct PowersOfTwoSequence2 : SequenceType
{
    typealias Generator = PowersOfTwoGenerator2
    let endPower : Int
    init(end: Int)
    {
        self.endPower = end
    }
    func generate() -> Generator {
        return Generator(end: self.endPower)
    }
}
```
As a first attempt this is not bad. This code works and have new capabilities, for example, we can now write:
```swift
for x in PowersOfTwoSequence2(end:10)
{
    println(x)
}
```
But there is a problem. It's easier to see if we move the generator inside the 
sequence class.
```swift
struct PowersOfTwoSequence3 : SequenceType
{
    let endPower : Int
    struct Generator : GeneratorType {
        typealias Element = Int
        var power : Int = 0
        var endPower : Int
        init(end : Int)
        {
            endPower = end
        }
        mutating func next() -> Element?
        {
            return (power < endPower) ? pow2(power++) : nil
        }
    }
    init(end: Int)
    {
        self.endPower = end
    }
    func generate() -> Generator {
        return Generator(end: self.endPower)
    }
}
```
Hopefully now the problem is plain to see. There is a lot of code repetition here. The two inits are almost identical, the `endPower` variable is repeated. Surely we can do better? And, of course, we can.
```swift
struct PowersOfTwoSequence4 : SequenceType
{
    let endPower : Int
    init(end: Int)
    {
        self.endPower = end
    }
    func generate() -> GeneratorOf<Int> {
        var power : Int = 0
        var nextClosure : () -> Int? = {
            (power < self.endPower) ? pow2(power++) : nil
        }
        return GeneratorOf<Int>(nextClosure)
    }
}
```
It's a little subtle what's going on here, so let's dig a little deeper. All 
the generator logic has been moved into a closure `nextClosure`. 
The closure captures the `endPower` from the enclosing class and the current 
`power` from the `generate` function. Finally, the `GeneratorOf<T>` class is a 
Standard Library Class that conforms to `GeneratorType` and 
knows how to use the closure to implement the `next` method.

Using trailing closure and type inference we can also write this as:
```swift
struct PowersOfTwoSequence5 : SequenceType
{
    let endPower : Int
    init(end: Int)
    {
        self.endPower = end
    }
    func generate() -> GeneratorOf<Int> {
        var power : Int = 0
        return GeneratorOf<Int> {
            (power < self.endPower) ? pow2(power++) : nil
        }
    }
}

for x in PowersOfTwoSequence5(end:10)
{
    println(x)
}
```
## Collections
A collection a sequence that conforms to the `CollectionType` protocol.
The `CollectionType` protocol is defined as follows.
```swift
/*
protocol _CollectionType : _SequenceType {
    typealias Index : ForwardIndexType
    var startIndex: Index { get }
    var endIndex: Index { get }
    typealias _Element
    subscript (_i: Index) -> _Element { get }
}
protocol CollectionType : _CollectionType, SequenceType {
    subscript (position: Self.Index) -> Self.Generator.Element { get }
    }
*/
```
So a `Collection` is a `Sequence` that can be accessed via a subscript.

We can upgrade our `PowersOfTwoSequence` to a `Collection` with a few small code changes.
```swift
struct PowersOfTwoCollection : CollectionType
{
    typealias Index = Int
    let startIndex : Int
    let endIndex : Int
    init(start:Int, end: Int)
    {
	self.startIndex = start
        self.endIndex = end
    }
    func generate() -> GeneratorOf<Int> {
        var power : Int = 0
        return GeneratorOf<Int> {
            (power < self.endIndex) ? pow2(power++) : nil
        }
    }
    subscript(i: Index) -> Int { return pow2(i) }
}
```

While many standard library functions can operate on sequences, some,
for example `reverse` require an object conforming to `CollectionType`.

``` swift
/* Now that we're a collection we can go backwards! */
for x in reverse(PowersOfTwoCollection(start:0,end:10)) {
    println(x)
}
```
