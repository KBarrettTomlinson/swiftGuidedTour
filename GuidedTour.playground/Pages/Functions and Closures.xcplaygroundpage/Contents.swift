//: ## Functions and Closures
//:
//: Use `func` to declare a function. Call a function by following its name with a list of arguments in parentheses. Use `->` to separate the parameter names and types from the function’s return type.
//:
func greet(person: String, special: String) -> String {
    return "Hello \(person), today's lunch special is \(special)."
}
var x: String = greet(person: "Bob", special: "Chicken Fried Steak")
print (x)
//: - Experiment:
//: Remove the `day` parameter. Add a parameter to include today’s lunch special in the greeting.
//:
//: By default, functions use their parameter names as labels for their arguments. Write a custom argument label before the parameter name, or write `_` to use no argument label.
//:
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print (greet("John", on: "Wednesday"))

//: Use a tuple to make a compound value—for example, to return multiple values from a function. The elements of a tuple can be referred to either by name or by number.
//:
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print("statistics",statistics)
print(statistics.sum)
print(statistics.2)

//: Functions can also take a variable number of arguments, collecting them into an array.
//:
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
print(sumOf(), "<--- sumOf")
print(sumOf(numbers: 42, 597, 12))
var kitten = sumOf(numbers: 34, 4, 11)
print("kitten",kitten)
kitten = 35
print(kitten)
print("wake up swift")


func avgOf(numbers: Int...) -> Int{
    var sum: Int = 0
    var count: Int = 0
    var avg: Int = 0
    
    for number in numbers {
        sum += number
        count += 1
    }
    
    if count != 0{
        avg = sum / count
    }
    return avg
}

print("avgOf",avgOf(numbers: 5,10,15,20,50))



//: - Experiment:
//: Write a function that calculates the average of its arguments.
//:
//: Functions can be nested. Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that is long or complex.
//:
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

print(returnFifteen(), "<<----- returnFifteen")

//: Functions are a first-class type. This means that a function can return another function as its value.
//:
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment, "<--increment function ")
print(increment(7))

//: A function can take another function as one of its arguments.
//:
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
print(hasAnyMatches(list: numbers, condition: lessThanTen))
func isFifteen(number: Int) -> Bool {
    return number == 15
}
numbers = [13,12,19,18,15]

print(hasAnyMatches(list: numbers, condition: isFifteen))

//: Functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed—you saw an example of this already with nested functions. You can write a closure without a name by surrounding code with braces (`{}`). Use `in` to separate the arguments and return type from the body.
//:
print(numbers.map({ (number: Int) -> Int in

    if (number % 2) == 0{
    let result = 3 * number
    return result
    }
    else{
        let result = 0
        return result
    }
}), "<--- numbers.map")

print(numbers.map({ (number: Int) -> Int in
//    print(number, "<--- number")
    let result: Int  = 10 * number
    return result
}))
//: - Experiment:
//: Rewrite the closure to return zero for all odd numbers.
//:
//: You have several options for writing closures more concisely. When a closure’s type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.
//:
let mappedNumbers = numbers.map({ (number: Int) -> Int in return 3 * number })
print(mappedNumbers, "<-- mapped numbers")
//Single statement closures implicitly return the value of their only statement.

//: You can refer to parameters by number instead of by name—this approach is especially useful in very short closures. A closure passed as the last argument to a function can appear immediately after the parentheses. When a closure is the only argument to a function, you can omit the parentheses entirely.
//:
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)



//: [Previous](@previous) | [Next](@next)
