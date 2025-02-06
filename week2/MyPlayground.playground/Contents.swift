
/*
Task 1

Implement the following function that calcualtes factorial.

If the input is nil, the function should return nil.
If the input is less than 0, print an error message and return nil.
Otherwise, return the factorial of the number using recursion.
 */


func factorial(n: Int?) -> Int? {
    guard let value = n else { return nil }
    
    if value < 0{
        print("Error! Argument must be greater than 0.")
    }else if value == 0 {
        return 1
    }
    if let result = factorial(n: value - 1){
        return value * result
    }else{
        return nil
    }
}

//let resultOfFactorial = factorial(n: 5)
// print(resultOfFactorial)

/*
 Task 2: Working With Arrays and custom Structures
 
 Create a structure Student. It should have a name: String and grades: [Double]

Implement a function averageGrade(for: Student, inClass: [String: Student]) -> Double.
 Implement a function bestStudent(for: Student, inClass: [String: Student]) -> (Student, Double)
 which finds the best student with higher average grade in a list of students.
 */

struct Student {
    var name: String
    var grades: [Double]
}


let students: [String: Student] = [
    "Alice": Student(name: "Alice", grades: [8.6, 9.2, 7.8]),
    "Bob": Student(name: "Bob", grades: [9.2, 8.8, 9.5]),
    "Charlie": Student(name: "Charlie", grades: [7.0, 7.5, 8.0])
]


func averageGrade(for student: Student, inClass: [String: Student]) -> Double {
    var curStudent = inClass[student.name]
    var result = (curStudent?.grades.reduce(0, +) ?? 0) / Double(curStudent?.grades.count ?? 0)
    return result
}


func bestStudent(inClass: [String: Student]) -> (Student, Double)? {
    return inClass.values.max { st1, st2 in
        averageGrade(for: st1, inClass: inClass) < averageGrade(for: st2, inClass: inClass)
    }.map { student in
        (student, averageGrade(for: student, inClass: inClass))
    }
}

//let results = bestStudent(inClass: students)
//print(results ?? "")

/*
 Task 3:
 
 */

var names: [String] = ["Alice", "Bob", "Charlie"]

func findLongestWord(in array: [String?]) -> String? {
    return array.compactMap{ $0 }.max {
        $0.count < $1.count
    }
}

//print(findLongestWord(in: names))


/*
 Task 4: Shopping List
 
 Create a structure ShoppingItem with the following properties:

 name
 quantity
 isPurchased
 Write a structure ShoppingList with the following props and functionalities:

 A dictionary of items. The name of the item is used as a key.
 A method addItem(item: ShoppingItem).
 A method markAsPurchased(item: ShoppingItem).
 A method markAsPurchased(itemName: String).
 A method listUnpurchasedItems() -> [ShoppingItems].

 */

struct ShoppingItem {
   var name: String
   var quantity: Int
   var isPurchased: Bool = false
}


struct ShoppingList {
    var items: [String: ShoppingItem] = [:]
    
    mutating func addItem(item: ShoppingItem){
        items.updateValue(item, forKey: item.name)
    }
    
    mutating func markAsPurchased(item: ShoppingItem){
        if var existingItem = items[item.name]{
            existingItem.isPurchased = true
            items[item.name] = existingItem
        }
    }
    
    mutating func markAsPurchased(itemName: String){
        if var existingItem = items[itemName]{
            existingItem.isPurchased = true
            items[itemName] = existingItem
        }
    }
    
    mutating func listUnpurchasedItems() -> [ShoppingItem]{
        return Array(items.values).filter { !$0.isPurchased }
    }
}

var shoppingList = ShoppingList()
shoppingList.addItem(item: ShoppingItem(name: "Apples", quantity: 5))
shoppingList.addItem(item: ShoppingItem(name: "Bananas", quantity: 3))
shoppingList.markAsPurchased(itemName: "Apples")

let unpurchased = shoppingList.listUnpurchasedItems()
//print(unpurchased)



