#Swift Standard Library: transcode

The `transcode` function lets to convert strings from one Unicode encoding to another, for example `UTF16` to `UTF8`.

The definition you get when you command-click on the function is quite intimidating:

```swift
/*
func transcode<         Input : GeneratorType,
                       Output : SinkType,
                InputEncoding : UnicodeCodecType,
               OutputEncoding : UnicodeCodecType
    where 

       InputEncoding.CodeUnit == InputEncoding.CodeUnit,
      OutputEncoding.CodeUnit == OutputEncoding.CodeUnit>

                (inputEncoding: InputEncoding.Type,
                outputEncoding: OutputEncoding.Type, 
                         input: Input, 
                        output: Output, 
                  #stopOnError: Bool) -> (Bool)
*/
```

If is also incorrect; a type constraint with the same type expression on both sides of the `==` sign is not much of a constraint.

```swift
/*
func transcode<         Input : GeneratorType,
                       Output : SinkType,
                InputEncoding : UnicodeCodecType,
               OutputEncoding : UnicodeCodecType
    where

       InputEncoding.CodeUnit == GeneratorType.Element
      OutputEncoding.CodeUnit == SinkType.Element>

                (inputEncoding: InputEncoding.Type,
                outputEncoding: OutputEncoding.Type,
                         input: Input,
                        output: Output,
                  #stopOnError: Bool) -> (Bool)
*/
```

In plain English, what these constraints are saying is that we need an input
source (a `GeneratorType`) that generates elements that are compatible with 
our input `UnicodeCodecType` and an output `SinkType` that can consume the output
of our output encoder.

The following code takes the UTF32 codepoint for the "Grinning Face with Smiling Eyes" 
emoji 😁 (I'm not kidding that is its official name!) and converts it to UTF8.

```swift
import UIKit
/*
GRINNING FACE WITH SMILING EYES
U+1f601
UTF8: 0xF0 0x9F 0x98 0x81
*/
let grin = UnicodeScalar(0x1f601)
String(Character(grin))

let inputArray : [UInt32] = [ grin.value ]
let input = inputArray.generate()
var outputArray : [UInt8] = []
var output = SinkOf<UInt8>({ outputArray.append($0) })

let error = transcode(UTF32.self, UTF8.self,
inputArray.generate(), output, stopOnError: true)

let utf8HexArray = outputArray.map { String(format: "%02x", $0) }
utf8HexArray
```
The values obtained seem to agree with the values I found on the 'net, but we can verify using Cocoa to construct a string from the UTF8 values
```swift
let utf8String = NSString(bytes: outputArray, length: countElements(outputArray), encoding: NSUTF8StringEncoding)
utf8String
```
In the playground for this tutorial the above code will print the emoji.


