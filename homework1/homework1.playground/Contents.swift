import UIKit

//Первое задание
protocol HomeworkService {
    // Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)

    // Функция должна вернуть числа фибоначчи.
    func fibonacci(n: Int) -> [Int]

    // Функция должна выполнить сортировку пузырьком.
    func sort(rawArray: [Int]) -> [Int]

    // Функция должна преобразовать массив строк в массив первых символов строки.
    func firstLetter(strings: [String]) -> [Character]

    // Функция должна отфильтровать массив по условию, которое приходит в параметре `condition`. (Нельзя юзать `filter` у `Array`)
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
}

struct Service: HomeworkService{
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        let first = x/y
        let second = x%y
        return(first, second)
    }
    
    
    
    
    func fibonacci(n: Int) -> [Int] {
       
    }
    
    
    
    
    func sort(rawArray: [Int]) -> [Int] {
        var array = rawArray
        
        for i in 0..<array.count {
            for j in 0..<(array.count - i - 1) {
                if array[j] > array[j + 1] {
                    let temp = array[j]
                    array[j] = array[j + 1]
                    array[j + 1] = temp
                }
            }
        }
        
        return array
    }
    
    
    
    func firstLetter(strings: [String]) -> [Character] {
        var result = [Character]()
        
        for string in strings {
            if let firstChar = string.first {
                result.append(firstChar)
            }
        }
        
        return result
    }
    
    
    
    
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
        var result = [Int]()
        
        for element in array {
            if condition(element) {
                result.append(element)
            }
        }
        
        return result
    }
}


//Второе задание
// Книги в наличии на выдачу
protocol Borrowable {
    var isBorrowed: Bool { get set }
    func borrow()
    func returnBook()
}

// Виды книг
enum BookType {
    case fiction
    case nonFiction
    case reference
}

// инфо о книге
class Book: Borrowable {
    var title: String
    var author: String
    var isBorrowed: Bool = false
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
    
    func borrow() {
        if !isBorrowed {
            isBorrowed = true
            print("Книга '\(title)' была взята в библиотеке.")
        } else {
            print("Книга '\(title)' уже взята в библиотеке.")
        }
    }
    
    func returnBook() {
        if isBorrowed {
            isBorrowed = false
            print("Книга '\(title)' была возвращена в библиотеку.")
        } else {
            print("Книга '\(title)' уже находится в библиотеке.")
        }
    }
}

// Комикс
class Comics: Book {
    var serialNumber: Int
    
    init(title: String, author: String, serialNumber: Int) {
        self.serialNumber = serialNumber
        super.init(title: title, author: author)
    }
    
    override func borrow() {
        print("Комиксы нельзя забирать из библиотеки.")
    }
    
    override func returnBook() {
        print("Комиксы нельзя возвращать в библиотеку.")
    }
}

// Главный зал
struct mainRoom {
    var roomNumber: Int
    private var shelves: [Book] = []
    
    mutating func addBook(_ book: Book) {
        shelves.append(book)
        print("Книга '\(book.title)' добавлена на полку в зале \(roomNumber).")
    }
    
    func getBooksCount() -> Int {
        return shelves.count
    }
}

// Библиотечный персонал
enum StaffType {
    case librarian
    case cleaner
    case Trainee
}

protocol LibraryStaff {
    var name: String { get }
    var staffType: StaffType { get }
    func duties()
}

// Библиотекарь
class Librarian: LibraryStaff {
    let name: String
    let staffType: StaffType = .librarian
    
    init(name: String) {
        self.name = name
    }
    
    func duties() {
        print("Библиотекарь \(name) принимает и отдает книги.")
    }
}

// Уборщик
class Cleaner: LibraryStaff {
    let name: String
    let staffType: StaffType = .cleaner
    
    init(name: String) {
        self.name = name
    }
    
    func duties() {
        print("Уборщик \(name) убирается в библиотеке.")
    }
}

// Стажёр
class Trainee: LibraryStaff {
    let name: String
    let staffType: StaffType = .Trainee
    
    init(name: String) {
        self.name = name
    }
    
    func duties() {
        print("Стажёр \(name) принимает и сортирует книги.")
    }
}

