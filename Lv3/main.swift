class Calculator {
    func execute(_ a: Double, _ b: Double) -> Double {
        fatalError("This method should be overridden by subclasses")
    }
}

class AddOperation: Calculator {
    override func execute(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}

class SubtractOperation: Calculator {
    override func execute(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
}

class MultiplyOperation: Calculator {
    override func execute(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
}

class DivideOperation: Calculator {
    override func execute(_ a: Double, _ b: Double) -> Double {
        if b == 0 {
            return 0
        } else {
            return a / b
        }
    }
}

class CalculatorClient {
    
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

let calculatorClient = CalculatorClient()

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

func performCalculation(calculatorClient: CalculatorClient, a: Double, b: Double, operation: String) -> Double {
    switch operation {
    case "+":
        return calculatorClient.add(a, b)
    case "-":
        return calculatorClient.subtract(a, b)
    case "*":
        return calculatorClient.multiply(a, b)
    case "/":
        return calculatorClient.divide(a, b)
    default:
        fatalError("오류")
    }
}

while true {
    guard let (a, b, operation) = getUserInput() else {
        print("입력이 잘못되었습니다.")
        continue
    }
    
    let result = performCalculation(calculatorClient: calculatorClient, a: a, b: b, operation: operation)
    print("Result: \(result)")
}
