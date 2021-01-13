import UIKit

//var str = "Hello, playground"
//
//
//    ===============================================
//                   Task 1: Library
//    ===============================================
//
//    1. Создайте класс книга, которая содержит свойства:
//        - автор
//        - название
//        - цвет обложки
//      Реализуйте функцию, которая выводит в консоль информацию о книге.
//    2. Создайте структуру электронная книга, которая содержит все те же свойства, что и книга из первого пункта
//    3. Создайте структуру библиотека, которая содержит в себе массив книг и массив электронных книг.
//    4. Реализуйте функцию в библиотеке, которая даёт вам почитать первую бумажную и электронную книгу (функция возвращает тьюпл). Если какой-нибудь массив пустой, то верните вместо книги nil
//    5. Создайте функцию, которая выводит в консоль информацию и первых книгах в библиотеке.
//    6. Создайте библиотеку, наполните ее книгами.
//    7. Возьмите книги из библиотеки, записав результат вызова функции в переменные eBook и book
//    8. Предположим, что вы залили обложку бумажной книги кофе. Измените цвет обложки обычной книги на чёрный.
//    9. Поменяйте цвет электронной книги на жёлтый.
//    10. Выведите информацию о книгах, которые вы взяли в библиотеке и сравните информацию с первыми книгами, которые лежат сейчас в библиотеке. Совпадают ли обложки? Почему?
//
//================= Solution =================== */

class Book {
    var authorOfBook: String
    var nameOfBook: String
    var colorOfBook: UIColor
    
    init(authorOfBook: String, nameOfBook: String, colorOfBook: UIColor) {
        self.authorOfBook = authorOfBook
        self.colorOfBook = colorOfBook
        self.nameOfBook = nameOfBook
    }
    
    func printInfoAboytBook() {
        print("""
            Автор книги \(self.authorOfBook).
            Название книги \(nameOfBook)
            Цвет обложки \(self.colorOfBook)
            """)
    }
    func changeColorOfBook(newValue: UIColor) { //функция для 8 задания
        self.colorOfBook = newValue
    }
}

let firstBook = Book.init(authorOfBook: "Абракадабра", nameOfBook: "ВтораяАбракадабра", colorOfBook: .black)

firstBook.changeColorOfBook(newValue: .yellow) // задание 8

struct ElectronicBook {
    var authorOfElectronicBook: String
    var nameOfElectronicBook: String
    var colorOfElectronicBook: UIColor
}

struct Library {
    var arrayOfBook: [Book] = []
    var arrayOfElectronicBook: [ElectronicBook] = []
}

//    func deliteLibrary() {
//        self.arrayOfBook = nil
//        self.arrayOfElectronicBook = nil
//    }
//
//func printFirstBooks() -> ([Book], [ElectronicBook]) {
//    if self.Book.isEmpty || self.Book.ElectronicBook.isEmpty {
//        return deliteLibrary
//    } else {
//        return ([Book.0], [ElectronicBook.0])
//    }
//}

enum ALotOfBooks: CaseIterable {
    case АннаКаренина
    case Автостопомпогалактике
    case АлисавСтранечудес
    
    init () {
        self = .Автостопомпогалактике
    }
    
    mutating func fullOfLibrary() {
        if self == .АннаКаренина{
            self = .Автостопомпогалактике
        } else if self == .Автостопомпогалактике {
            self = .АлисавСтранечудес
        } else if self == .АлисавСтранечудес{
            self = .АннаКаренина
        }
    }
}

print(ALotOfBooks.allCases.count)

var eBook = ALotOfBooks.Автостопомпогалактике
var book = ALotOfBooks.АлисавСтранечудес


let basicBook: Book = Book(authorOfBook: "Уоллс",
                           nameOfBook: "Замок из стекла",
                           colorOfBook: .black)

let electronicBook: ElectronicBook = ElectronicBook(authorOfElectronicBook: "Достоевский",
                                                    nameOfElectronicBook: "Мертвые души",
                                                    colorOfElectronicBook: .yellow)


//    ===============================================
//                  Task 2: Student
//    ===============================================
//
//    1. Создайте структуру, которая описывает студента, содержащую следующие свойства:
//        - имя
//        - фамилия
//        - отчество
//        - средний балл - по умолчанию 7.0
//        - изучаемся специальность — представлена перечислением ‘Speciality’
//        - флаг начисляется ли студенту стипендия: опционал. Задайте значение по умолчанию nil
//        - массив оценок, полученных студентом
//    2. Создайте вложенное перечисление Speciality со специальностями на ваш выбор
//    3. Создайте функцию calculateAverageMark в структуре студента, которая будет высчитывать средний балл в зависимости от массива оценок и присваивать средний бал в соответствующее свойство структуры. Если средний бал меньше 7, то студент не получает стипендию.
//    4. Создайте функцию, которая принимает массив оценок. Воспользуйтесь ярлыком аргумента. Добавьте оценки из параметра функции в локальную переменную структуры. Вызовите функцию расчета среднего балла
//    5. Создайте функцию clearStudentResults, которая очищает массив оценок студента, устанавливает среднюю оценку 0 и флаг стипендии в nil
//    6. Создайте функцию, которая выводит всю информацию о студенте в консоль
//    7. Создайте функцию, которая возвращает сумму стипендии. Стипендия вычисляется в зависимости от среднего балла и специальности.
//    Базовая стипендия — 75. За каждый бал выше 7, увеличивайте базовую стипендию на 10 процентов. Если студент юрист, инженер-программист или учитель, то увеличьте стипендию ещё на 5%
//    7. Создайте экземпляр структуры студент, проинициализировав его нужными свойствами и оценками: 7, 8, 5, 4, 9, 10, 9
//    8. Вызовите функцию расчета среднего бала студента и его стипендии
//    9. Вызовите функцию, которая добавляет оценки студента, передав ей массив из рандомных оценок от 0 до 10
//    10. Вызовите функцию расчета среднего бала студента и стипендии
//    11. Выведите в консоль всю информацию о студенте
//    12. Вызовите функцию очистки результатов студента
//
//================= Solution =================== */

enum Speciality {
    case адвокат
    case агроном
    case юрист
    case экономист
}

enum ScholarshipForFunction: Int {
    case base = 75
    case aboveThe7 = 83
    case onceMore = 87
}

struct student {
    var name: String
    var surName: String
    var patronymic: String
    var average: Double = 7.0
    var speciality: Speciality
    var bonus: Bool? = nil
    var marks = [7,8,5,6]
    
    mutating func noBonus() {
        self.bonus ?? false
    }
    
    mutating func calculateAverageMark() {
        if self.marks.reduce(0, +) / self.marks.count > Int(7.0) {
            return self.noBonus()
        }
    }
    
    mutating func clearStudentResults() {
        self.marks = []
        self.average = 0
        self.bonus = nil
    }
    
    func printInfo() {
        print("""
            \(self.name)
            \(self.surName)
            \(self.patronymic)
            \(self.average)
            \(self.speciality)
            \(String(describing: self.bonus))
            \(self.marks)
            """)
    }
    
    func scholarship() -> Int {
        switch self {
        case .onceMore where Speciality.юрист:
            return 87
        case .aboveThe7 where Speciality.адвокат:
            return 83
        default:
            return 75
        }
    }
}



class StudentOfClass {
    var name: String
    var surName: String
    var patronymic: String
    var average: Double = 7.0
    var speciality: Speciality
    var bonus: Bool? = nil
    var marks: [Int] = [7, 8, 5, 4, 9, 10, 9]
    
    init(name: String,
         surName: String,
         patronymic: String,
         average: Double = 7.0,
         speciality: Speciality,
         bonus: Bool? = nil,
         marks: [Int] = [7, 8, 5, 4, 9, 10, 9]) {
        
        self.name = name
        self.surName = surName
        self.patronymic = patronymic
        self.average = 7.0
        self.speciality = speciality
        self.bonus = nil
        self.marks = [7, 8, 5, 4, 9, 10, 9]
    }
}


var createTheStudent = student.init(name: "Peter", surName: "Ivanov", patronymic: "Ivanovich", average: 9.0, speciality: .экономист, marks: [7, 8, 5, 4, 9, 10, 9])

createTheStudent.calculateAverageMark()
print(student.init(name: "Peter", surName: "Ivanov", patronymic: "Ivanovich", average: 9.0, speciality: .экономист, marks: [7, 8, 5, 4, 9, 10, 9]).calculateAverageMark())


createTheStudent.scholarship()
createTheStudent.printInfo()
createTheStudent.clearStudentResults()


//    ===============================================
//                     Task 3: Group
//    ===============================================
//    1. Создайте класс ‘StudentGroup’
//    2. Добавьте в него свойства:
//        - массив студентов (структура из первого задания)
//        - староста (студент из первого задания). Опционал
//        - номер группы
//    3. Добавьте функцию, которая принимает массив студентов и добавляет студентов в группу
//    4. Добавьте функцию, которая принимает одного студента и добавляет в массив студентов
//    5. Добавьте функцию выбора старосты, которая случайным образом выбирает человека из массива студентов и назначает старостой. Функция возвращает старосту, либо отсутствующее значение, если старосту не удалось выбрать или группа пуста.
//    6. Создайте группу, добавив туда студентов.
//    7. Выведите всех студентов в консоль, вызвав функцию вывода информации о каждом из них
//    8. Выберите старосту
//    9. Измените специальность старосты, обратившись к свойству (староста)
//    10. Поменялась ли специальность старосты в массиве студентов? Почему и как этого можно добиться?
//
//================ Solution =================== */

struct student2 {
    var name: String
    var surName: String
    var patronymic: String
    var average: Double = 7.0
    var speciality: Speciality
    var bonus: Bool? = nil
    var marks = [7,8,5,6]
    
    init(name: String, surName: String, speciality: Speciality) {
        self.name = name
        self.surName = surName
        self.speciality = speciality
    }
    
    class StudentGroup {
        var students: [student2] = []
        var headMan: String? = ""
        var numberOfGroup: Int
        
        init(students: [student2] = [], numberOfGroup: Int) {
            self.students = students
            self.numberOfGroup = numberOfGroup
        }
        
        func setStudent(_ student2: [String]) {
            self.students.append([student2])
        }
        
        func setTheHeadMan() {
            self.headMan = "Ивано Петр Витальевич"
        }
        
        func printInfoFromClass() {
            print("""
            \(self.students)
            \(String(describing: self.headMan))
            \(self.numberOfGroup)
            """)
        }
    }
}

var firstStudent = StudentGroup.init(students: student2.init(name: "Петя", surName: "Яковлев", speciality: .агроном), numberOfGroup: 2)
var secondStudent = StudentGroup.init(students: student2.init(name: "Вася", surName: "Яковлев", speciality: .адвокат), numberOfGroup: 2)
var thirdStudent = StudentGroup.init(students: student2.init(name: "Люба", surName: "Иванова", speciality: .экономист), numberOfGroup: 2)

StudentGroup.printInfoFromClass

StudentGroup.setStudent.firstStudent()
StudentGroup.setStudent.secondStudent()
StudentGroup.setStudent.thirdStudent()


//    ===============================================
//                   Task 4: Speciality
//    ===============================================

//Вынесите перечисление специальности студента из структуры в отдельную сущность. Измените код из пункта 1 и 2 так, чтобы компилятор не ругался
//1. Добавьте функцию внутри перечисления, которая определяет является ли специальность гуманитарной. Для этого вам потребуется сделать switch self. Помните, что несколько case можно писать через запятую.
//2. Добавьте функцию, которая возвращает локализированное на русский язык название специальности.
