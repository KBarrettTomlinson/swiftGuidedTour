//: ## Control Flow
//:
//: Use `if` and `switch` to make conditionals, and use `for`-`in`, `for`, `while`, and `repeat`-`while` to make loops. Parentheses around the condition or loop variable are optional. Braces around the body are required.
//:
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
print(teamScore)
for score in individualScores {
    if score > 50 {
        teamScore += 3
        print("inside greater than 50 \(teamScore)")
    } else {
        teamScore += 1
        print("inside less than or equal to 50 \(teamScore)")
    }
}
print(teamScore)


//: In an `if` statement, the conditional must be a Boolean expression—this means that code such as `if score { ... }` is an error, not an implicit comparison to zero.
//:
//: You can use `if` and `let` together to work with values that might be missing. These values are represented as optionals. An optional value either contains a value or contains `nil` to indicate that a value is missing. Write a question mark (`?`) after the type of a value to mark the value as optional.
//:
var optionalString: String? = "Hello"
print(optionalString == nil)


var optionalName: String? = "Karen"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(optionalName!)"
    print(greeting)
}
else if optionalName == nil{
    greeting = "Hey, I don't understand this if let stuff"
    print(greeting)
}
print(greeting)

//: - Experiment:
//: Change `optionalName` to `nil`. What greeting do you get? Add an `else` clause that sets a different greeting if `optionalName` is `nil`.
//:
//: If the optional value is `nil`, the conditional is `false` and the code in braces is skipped. Otherwise, the optional value is unwrapped and assigned to the constant after `let`, which makes the unwrapped value available inside the block of code.
//:
//: Another way to handle optional values is to provide a default value using the `??` operator. If the optional value is missing, the default value is used instead.
//:
let nickName: String? = "Blerb"
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
print(informalGreeting)

//: Switches support any kind of data and a wide variety of comparison operations—they aren’t limited to integers and tests for equality.
//:
let vegetable = "red pepper"
switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    default:
        print("Everything tastes good in soup.")
}

//: - Experiment:
//: Try removing the default case. What error do you get?
//:
//: Notice how `let` can be used in a pattern to assign the value that matched the pattern to a constant.
//:
//: After executing the code inside the switch case that matched, the program exits from the switch statement. Execution doesn’t continue to the next case, so there is no need to explicitly break out of the switch at the end of each case’s code.
//:
//: You use `for`-`in` to iterate over items in a dictionary by providing a pair of names to use for each key-value pair. Dictionaries are an unordered collection, so their keys and values are iterated over in an arbitrary order.
//:
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestKind: String? = nil
for (kittyfoo, numbers) in interestingNumbers {
    print(kittyfoo)
    for number in numbers {
        print(kittyfoo, number, numbers)
        if number > largest {
            largest = number
            largestKind = kittyfoo
            print("one",largest, largestKind!)
        }
    print("two",largest)
    }
print("three",largest)
}
print("final",largest,largestKind!)

//: - Experiment:
//: Add another variable to keep track of which kind of number was the largest, as well as what that largest number was.
//:
//: Use `while` to repeat a block of code until a condition changes. The condition of a loop can be at the end instead, ensuring that the loop is run at least once.
//:
var n = 100
while n < 100 {
    n *= 2
    print("inside while", n)
}
print("while first", n)

var m = 15
repeat {
    print("inside repeat", m)
    m *= 2
} while m < 100
print(m)

//: You can keep an index in a loop by using `..<` to make a range of indexes.
//:
var total = 0
for i in 0...4 {
    print("this is i", i)
    total += i + 15
    var p = 0
    while p < 100 {
        print("I'm inside the while", p)
        p += 1
    }
    print("this is total", total)
}
print(total)

//: Use `..<` to make a range that omits its upper value, and use `...` to make a range that includes both values.
//:


//: [Previous](@previous) | [Next](@next)
