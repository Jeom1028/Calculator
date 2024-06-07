class AbstractOperation {
    func execute(_ a: Double, _ b: Double) -> Double {
        return 0
    }
}

class AddOperation: AbstractOperation {
    override func execute(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}

class SubtractOperation: AbstractOperation {
    override func execute(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
}

class MultiplyOperation: AbstractOperation {
    override func execute(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
}

class DivideOperation: AbstractOperation {
    override func execute(_ a: Double, _ b: Double) -> Double {
        if b == 0 {
            return 0
        } else {
            return a / b
        }
    }
}

class Calculator {
    
    private let addOperation = AddOperation()
    private let subtractOperation = SubtractOperation()
    private let multiplyOperation = MultiplyOperation()
    private let divideOperation = DivideOperation()
    
    func add(_ a: Double, _ b: Double) -> Double {
        return addOperation.execute(a, b)
    }
    func subtract(_ a: Double, _ b: Double) -> Double {
        return subtractOperation.execute(a, b)
    }
    func multiply(_ a: Double, _ b: Double) -> Double {
        return multiplyOperation.execute(a, b)
    }
    func divide(_ a: Double, _ b: Double) -> Double {
        return divideOperation.execute(a, b)
    }
}

let calculator = Calculator()

func getUserInput() -> (Double, Double, String)? {
    print("첫번째 숫자: ", terminator: "")
    guard let inputA = readLine(), let a = Double(inputA) else {
        return nil
    }
    
    print("두번째 숫자: ", terminator: "")
    guard let inputB = readLine(), let b = Double(inputB) else {
        return nil
    }
    
    print("(+, -, *, /): ", terminator: "")
    guard let operation = readLine(), ["+", "-", "*", "/"].contains(operation) else {
        return nil
    }
    
    return (a, b, operation)
}

func performCalculation(calculator: Calculator, a: Double, b: Double, operation: String) -> Double {
    switch operation {
    case "+":
        return calculator.add(a, b)
    case "-":
        return calculator.subtract(a, b)
    case "*":
        return calculator.multiply(a, b)
    case "/":
        return calculator.divide(a, b)
    default:
        fatalError("오류")
    }
}

while true {
    guard let (a, b, operation) = getUserInput() else {
        print("입력이 잘못되었습니다.")
        continue
    }
    
    let result = performCalculation(calculator: calculator, a: a, b: b, operation: operation)
    print("Result: \(result)")
}
