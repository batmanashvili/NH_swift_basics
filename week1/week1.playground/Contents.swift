

// counts 1 to 10 and prints Even or Odd.

func isEvenOrOdd(number: Int) -> Void {
    if(number % 2 == 0){
        print("\(number) Even")
    }else{
        print("\(number) Odd")
    }
};

for index in 1...10{
    isEvenOrOdd(number: index);
};

var countValue = 1;

while(countValue <= 10){
    isEvenOrOdd(number: countValue);
    countValue += 1;
};

countValue = 1;

repeat {
    isEvenOrOdd(number: countValue);
    countValue += 1;
}while countValue <= 10;



/*
Create an array of 10 favorite TV Series or movies. Loop through the items and do the following transformation:
if the index of an item is divisible to 3 (no reminder) print it uppercased.
if the index of an item is divisible to 4 (no reminder) capitalize each word.
*/

var movies: [String] = ["inception", "the godfather", "the grand budapest hotel", "parasite", "jurassic park", "the shawshank redemption", "interstellar",
                        "the dark knight", "12 angry men", "schindler"]

for (index, movie) in movies.enumerated(){
    if(index % 3 == 0){
        print("index: \(index) Movie name: \(movie.uppercased())")
    }else if(index % 4 == 0){
        print("index: \(index) Movie name: \(movie.prefix(1).uppercased() + movie.dropFirst())")
    }else{
        print("index: \(index) Movie name: \(movie)")
    }
}
movies.append("yellow stone")

for movie in movies{
    print("Movie name: \(movie)")
}

/*
 Store the names of students as keys and their grades as values. Create a program to:
 Print all students and their grades.
 Add a new student and their grade to the dictionary.
 Find and print the grade of a specific student.
 */

var students: [String: Int] = ["ali": 88, "veli": 92, "mehmet": 79]

for (student, grade) in students{
    print("Student: \(student) Grade:\(grade)")
}

students["david"] = 89

students.forEach{ (key, val) in
    if(key == "david"){
        print("David's Grade is: \(val)")
    }
    
}

/*
 Define a tuple with the following properties: name (String), age (Int), and city (String). Print each property on a separate line.
 Update the city in the tuple and print the updated tuple.
 */

var person: (name: String, age: Int, city: String) = ("Ali", 29, "Tbilisi")


print("Person Name: \(person.0)" )
print("Person Age: \(person.1)" )
print("Person City: \(person.2)" )

person.city = "Batumi"
print("New City: \(person.2)")


/*
 Write a program to:
 Create a constant array of 5 shopping items. Each item should has a price. (use tuples)
 Use a loop to print all items.
 Create a variable for the total cost (starting at 0). Calculate and print the total cost.
 */

let shoppingItems: [(String, Int)] = [
    ("Carrot", 2),
    ("Apple", 3),
    ("Milk", 5),
    ("Bread", 4),
    ("Cheese", 6)
]

for (item, price) in shoppingItems{
    print("Item: \(item) Price: \(price)")
}

var totalCost: Int = 0

shoppingItems.forEach { (item, price) in
    totalCost += price
}

print("Total Cost: \(totalCost)")





