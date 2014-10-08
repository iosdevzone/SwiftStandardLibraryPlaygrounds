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
