struct PowersOfTwoCollection : CollectionType
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
        var power : Int = self.startIndex
        return GeneratorOf<Int> {
            (power < self.endIndex) ? pow2(power++) : nil
        }
    }
    subscript(i: Index) -> Int { return pow2(i) }
}

for x in reverse(PowersOfTwoCollection(start:0,end:10)) {
    println(x)
}

