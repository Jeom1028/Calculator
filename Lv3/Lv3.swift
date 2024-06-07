//class AddOperation {
//    func execute(_ a: Double, _ b: Double) -> Double {
//        return a + b
//    }
//}
//
//class SubtractOperation {
//    func execute(_ a: Double, _ b: Double) -> Double {
//        return a - b
//    }
//}
//
//class MultiplyOperation {
//    func execute(_ a: Double, _ b: Double) -> Double {
//        return a * b
//    }
//}
//
//class DivideOperation {
//    func execute(_ a: Double, _ b: Double) -> Double {
//        if b == 0 {
//            return 0
//        } else {
//            return a / b
//        }
//    }
//}
//
//class Calculator {
//    private let addOperation = AddOperation()
//    private let subtractOperation = SubtractOperation()
//    private let multiplyOperation = MultiplyOperation()
//    private let divideOperation = DivideOperation()
//    
//    func add(_ a: Double, _ b: Double) -> Double {
//        return addOperation.execute(a, b)
//    }
//    
//    func subtract(_ a: Double, _ b: Double) -> Double {
//        return subtractOperation.execute(a, b)
//    }
//    
//    func multiply(_ a: Double, _ b: Double) -> Double {
//        return multiplyOperation.execute(a, b)
//    }
//    
//    func divide(_ a: Double, _ b: Double) -> Double {
//        return divideOperation.execute(a, b)
//    }
//}
//
//let calculator = Calculator()
//
//// Calculator를 사용하여 계산을 수행
//let result1 = calculator.add(5, 3) // 덧셈: 8
//let result2 = calculator.subtract(5, 3) // 뺄셈: 2
//let result3 = calculator.multiply(5, 3) // 곱셈: 15
//let result4 = calculator.divide(6, 3) // 나눗셈: 2
