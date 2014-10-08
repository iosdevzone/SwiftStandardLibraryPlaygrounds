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
