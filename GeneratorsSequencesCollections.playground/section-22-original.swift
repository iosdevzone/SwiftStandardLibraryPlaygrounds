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
