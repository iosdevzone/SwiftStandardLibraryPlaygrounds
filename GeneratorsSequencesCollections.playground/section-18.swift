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
