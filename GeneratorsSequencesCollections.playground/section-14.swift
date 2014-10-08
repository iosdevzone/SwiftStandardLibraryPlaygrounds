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
