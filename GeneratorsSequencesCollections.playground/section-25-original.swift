struct PowersOfTwoCollection : SequenceType
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
            (power < self.endPower) ? pow2(power++) : nil
        }
    }
    subscript(i: Index) -> Int { return pow2(i) }
}
