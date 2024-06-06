import Foundation

protocol Operation {
    func execute(_ a: Double, _ b: Double) -> Double
}

class Addition: Operation {
    func execute(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}

class Subtraction: Operation {
    func execute(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
}

class Multiplication: Operation {
    func execute(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
}

class Division: Operation {
    func execute(_ a: Double, _ b: Double) -> Double {
        if b == 0 {
            print("0으로 나누었습니다")
            return 0
        } else {
            return a / b
        }
    }
}

class Calculator {
    
    private let addition = Addition()
    private let subtraction = Subtraction()
    private let multiplication = Multiplication()
    private let division = Division()
    
    func add(_ a: Double, _ b: Double) -> Double {
        return addition.execute(a, b)
    }
    func subtract(_ a: Double, _ b: Double) -> Double {
        return subtraction.execute(a, b)
    }
    func multiply(_ a: Double, _ b: Double) -> Double {
        return multiplication.execute(a, b)
    }
    func divide(_ a: Double, _ b: Double) -> Double {
        return division.execute(a, b)
    }
}

let calculator = Calculator()

func getUserInput() -> (Double, Double, String)? {
    print("첫번째 숫자: ", terminator: "")
    guard let inputA = readLine(), let a = Double(inputA) else {
        print("잘못된 입력")
        return nil
    }
    
    print("두번째 숫자: ", terminator: "")
    guard let inputB = readLine(), let b = Double(inputB) else {
        print("잘못된 입력")
        return nil
    }
    
    print("(+, -, *, /): ", terminator: "")
    guard let operation = readLine(), ["+", "-", "*", "/"].contains(operation) else {
        print("잘못된 입력")
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
        fatalError("Unsupported operation")
    }
}

while true {
    if let (a, b, operation) = getUserInput() {
        let result = performCalculation(calculator: calculator, a: a, b: b, operation: operation)
        print("Result: \(result)")
    } else {
        print("Invalid input, please try again.")
    }
    
    print("다른 계산을 하시겠습니까? (yes/no): ", terminator: "")
    if let continueInput = readLine(), continueInput.lowercased() == "yes" {
        break
    }
}
