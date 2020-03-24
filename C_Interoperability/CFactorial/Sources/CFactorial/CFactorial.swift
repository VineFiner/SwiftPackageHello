import factorial

public
struct CFactorial {
    var value: Int
    
    public
    init(_ value: Int) {
        self.value = value
    }
    public
    func calculation() -> Int {
        return factorial(Int32(value))
    }
}
