/*
protocol _CollectionType : _SequenceType {
    typealias Index : ForwardIndexType
    var startIndex: Index { get }
    var endIndex: Index { get }
    typealias _Element
    subscript (_i: Index) -> _Element { get }
}
protocol CollectionType : _CollectionType, SequenceType {
    subscript (position: Self.Index) -> Self.Generator.Element { get }
    }
*/
