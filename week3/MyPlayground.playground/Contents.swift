/*
 Task 1: Area Calculator

 Create a protocol Shape with a function area() -> Double.
 Create the following structs that conform to the Shape protocol:

 Rectangle with properties width and height.
 Circle with property radius.
 Implement the area function for both structs.

 Extra Task: Add an extension to the Shape protocol to include a description property that returns the name of the shape. Extra Task: Create a list of Shape-s and calcualte their total area.
 
 */

protocol Shape {
    func area() -> Double
}

extension Shape {
    var description: String {
        return String(describing: self)
    }
}


struct Rectangle: Shape {
    var width: Double
    var height: Double
    
    func area() -> Double {
        return width * height
    }
}

struct Circle: Shape {
    var radius: Double
    
    func area() -> Double{
        Double.pi * radius * radius
    }
}

var rectangle = Rectangle(width: 10, height: 20)
var circle = Circle(radius: 5)

let shapes: [Shape] = [rectangle, circle]

let totalArea = shapes.reduce(0) { $0 + $1.area()}
//print(totalArea)

/*
 Task 2: Person and Employee
 
 Create a base class Person with the following properties:

 name: String
 age: Int
 Add a method greet() that prints: "Hi, I'm [name] and I'm [age] years old."

 Create a subclass Employee that inherits from Person and adds:

 jobTitle: String
 Override the greet() method to include the job title: "Hi, I'm [name], a [jobTitle], and I'm [age] years old."

 Extra Task: Add an initializer to Employee that calls the base class designated initializer.
 */

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.age = age
        self.name = name
    }
    
    func greet() {
        print("Hi, I'm \(name) and I'm \(age) years old.")
    }
}

class Employee: Person {
    var jobTitle: String
    
    init(name: String, age: Int, jobTitle: String){
        self.jobTitle = jobTitle
        super.init(name: name, age: age)
    }
    
    override func greet() {
        print("Hi, I'm \(name), a \(jobTitle) and I'm \(age) years old.")
    }
}

var superEmployee = Employee(name: "Bob", age: 34, jobTitle: "Software Developer")
//superEmployee.greet()

/*
 Task 3: Power Consumption

 Create a protocol Appliance with:

 A property powerUsage: Double (in watts).
 A function calculateMonthlyConsumption(hours: Double) -> Double.
 Create two structs, WashingMachine and Refrigerator, conforming to Appliance protocol.

 WashingMachine should have a power usage of 500 watts.
 Refrigerator should have a power usage of 100 watts.
 Add an extension to the Appliance protocol to provide a default implementation of calculateMonthlyConsumption(hours:).

 Extra Task: Add a computed property description in the extension that returns a string: "This appliance uses [powerUsage] watts each month."

 Extra Task: Update the implementation so it includes consumption per hour. Each appliance should have average number of hours per each month.

 */

protocol Appliance {
    var powerUsage: Double {get}
    func calculateMonthlyConsumption(hours: Double) -> Double
}

extension Appliance {
    func calculateMonthlyConsumption(hours: Double) -> Double{
        return self.powerUsage * hours
    }
    
    var description: String{
        return "This appliance uses \(powerUsage) watts each month and \(powerUsage / (30 * 24 * 60)) watts per hour."
    }
}

struct WashingMachine: Appliance {
    var powerUsage: Double = 500
}

struct Refrigerator: Appliance {
    var powerUsage: Double = 100
}

//var myWashingMachine = WashingMachine()
//print(myWashingMachine.description)
//
//var myRefrigerator = Refrigerator()
//print(myRefrigerator.description)


/*
 Task 4: Library

 Create a struct Book with properties:
 title: String
 author: String

 Create a protocol Borrowable with:
 A function borrow()
 A function returnBook()
 
 Create a class Library with:
 A property books: [Book].
 Functions addBook(_:) and removeBook(_:).
 Conform Library to the Borrowable protocol:

 borrow() should remove a book from the collection.
 returnBook() should add the book back.
 Extra Task: Add an extension to Library to include a method listBooks() that prints all available books.

 */

struct Book {
    var title: String
    var author: String
}

protocol Borrowable {
    func borrow(bookTitle: String)
    func returnBook(_ book: Book)
}

class Library: Borrowable {
    var books: [Book] = []
    
    func addBook(_ book: Book) {
        books.append(book)
    }
    
    func removeBook(_ book: Book){
        books.removeAll{ $0.title == book.title }
    }
    
    func borrow(bookTitle: String) {
        if let book = books.first(where: {$0.title == bookTitle}){
            print("Borrowed \(book.title)")
            removeBook(book)
        }else{
            print("Book not found")
        }
    }
    
    func returnBook(_ book: Book) {
        addBook(book)
    }
    
    func listBooks(){
        for book in books.enumerated() {
            print("\(book.element.title) by \(book.element.author)")
        }
    }
}

var library = Library()
var orwelBook = Book(title: "1984", author: "George Orwell")
//library.addBook(orwelBook)
//library.addBook(Book(title: "To Kill a Mockingbird", author: "Harper Lee"))
//library.listBooks()
//
//library.borrow(bookTitle: "1984")
//library.listBooks()
//library.returnBook(orwelBook)
//library.listBooks()


/*
 Task 5: Vehicles

 Create a base class Vehicle with properties:

 make: String
 model: String
 fuelEfficiency: Double (in km per liter)
 Add a method calculateFuelNeeded(for distance: Double) -> Double.

 Create a subclass ElectricCar with an additional property:
 batteryCapacity: Double (in kWh)
 Override calculateFuelNeeded(for:) to calculate the energy needed in kWh based on battery efficiency (e.g., 5 km per kWh).

 Extra Task: Add an extension to Vehicle to include a method description() that prints the make and model.

 */

class Vehicle {
    var make: String
    var model: String
    var fuelEfficiency: Double
    
    init(make: String, model: String, fuelEfficiency: Double) {
        self.make = make
        self.model = model
        self.fuelEfficiency = fuelEfficiency
    }
    
    func calculateFuelNeeded(for distance: Double) -> Double{
        return distance/fuelEfficiency
    }
}

class ElectricCar: Vehicle {
    var batteryCapacity: Double
    
    init(make: String, model: String, fuelEfficiency: Double, batteryCapacity: Double) {
        self.batteryCapacity = batteryCapacity
        super.init(make: make, model: model, fuelEfficiency: fuelEfficiency )
    }
    
    override func calculateFuelNeeded(for time: Double) -> Double{
        return time/fuelEfficiency
    }
}

extension Vehicle {
    func description() -> String {
        return "Make: \(make), Model: \(model)"
    }
}

//let car = Vehicle(make: "Toyota", model: "Corolla", fuelEfficiency: 15)
//print(car.calculateFuelNeeded(for: 150))
//
//let tesla = ElectricCar(make: "Tesla", model: "Model 3", fuelEfficiency: 5, batteryCapacity: 50)
//print(tesla.calculateFuelNeeded(for: 150))
