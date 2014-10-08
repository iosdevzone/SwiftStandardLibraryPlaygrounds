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
