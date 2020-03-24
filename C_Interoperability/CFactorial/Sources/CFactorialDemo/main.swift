import CFactorial

if CommandLine.arguments.count != 2 {
    print("eg: swift run CFactorialDemo 5 ")
} else {
    let input = CommandLine.arguments[1]
    if let number = Int(input) {
        let result = CFactorial(number)
        print("\(number) 的阶乘是: \(result.calculation())")
    }
}

