import UIKit

let inputArray : [UInt32] = [ 0x1f601 ]
let input = inputArray.generate()
var outputArray : [UInt8] = []
var output = SinkOf<UInt8>({ outputArray.append($0) })

let error = transcode(UTF32.self, UTF8.self,
    inputArray.generate(), output, stopOnError: true)

    let utf8HexArray = outputArray.map { String(format: "%02x", $0) }
    utf8HexArray