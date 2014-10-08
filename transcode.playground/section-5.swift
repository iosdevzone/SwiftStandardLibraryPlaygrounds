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