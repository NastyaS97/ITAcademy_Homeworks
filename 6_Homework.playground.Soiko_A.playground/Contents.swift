import UIKit

// ===============================================
//            Task 1: Пользователи
// ===============================================
//
// 1. Создайте tuple, состоящий из
//    - имя пользователя
//    - его логин
//    - пол: (мужской / женский) enum
//    - месяц день рождения enum
// 2. Создайте коллекцию упорядоченных значений, состоящих из 5 пользователей
// 3. Добавьте ещё 2 пользователя в массив
// 4. Выведите всех пользователей, у которых месяц день рождения август
// 5. Поздравьте каждого, кто родился в декабре с днём рождения, обратившись по имени.
// Пожелайте разных вещей в зависимости от пола (мужчинам одно, а женщинам другое)
// 6. Обновите логин всех пользователей, переведя его в верхний регистр.
// 7. Удалите 4 и 7 пользователя (не забудьте сделать проверку)
//
// ================= Solution ===================

enum gender {
    case male, female
}

enum Months {
    case january, february, march, april, may, june, july, august, september, october, november, december
}
var nameTuple: String
var password: String

let firstName = ("Alex", "jcnech765", gender.male, Months.july)
let secondName = ("Jon", "jnjxh558h", gender.male, Months.september)
let thirdName = ("Kate", "jdnn847ij", gender.female, Months.april)
let fourthName = ("Nina", "efok9848", gender.female, Months.august)
let fifthName = ("Yen", "ckjrnejk", gender.female, Months.february)
let sixName = ("Petya", "ejnnjne87", gender.male, Months.june)
let sevenName = ("Kristina", "vkjenj87", gender.female, Months.march)

var allNames = [firstName, secondName, thirdName, fourthName, fifthName]
allNames.insert(sixName, at: 1)
allNames.insert(sevenName, at: 0)
print(allNames)

for name in allNames {
    switch allNames {
    case _ where name.3 == Months.august:
        print("Все люди у которых ДР в августе:", fourthName.0)
    case _ where name.3 == Months.december && name.2 == gender.female:
        print(" будь всегда самой красивой")
    case _ where name.3 == Months.december && name.2 == gender.male:
        print(" будь всегда самой красивой")
    default:
        break
    }
}

allNames.count

firstName.0.uppercased()
print(firstName.0.uppercased(), firstName.1, firstName.2, firstName.3)
secondName.0.uppercased()
print(secondName.0.uppercased(), secondName.1, secondName.2, secondName.3)
thirdName.0.uppercased()
print(thirdName.0.uppercased(), thirdName.1, thirdName.2, thirdName.3)
fourthName.0.uppercased()
print(fourthName.0.uppercased(), fourthName.1, fourthName.2, fourthName.3)
fifthName.0.uppercased()
print(fifthName.0.uppercased(), fifthName.1, fifthName.2, fifthName.3)
sixName.0.uppercased()
print(sixName.0.uppercased(), sixName.1, sixName.2, sixName.3)
sevenName.0.uppercased()
print(sevenName.0.uppercased(), sevenName.1, sevenName.2, sevenName.3)

allNames.count
allNames.remove(at: 4)
allNames.count  // седьмого элемента больше нет

// ===============================================
//            Task 2: Регистратура
// ===============================================
// В поликлинике полетела база данных. В итоге карточки клиентов перемешались, сбилось форматирование имён и создались дубликаты. Помогите бедным регистраторам актуализировать базу данных
// 1. Разбейте строку clientCards на массив клиентов. Разделителем считайте ';'
// 2. Создайте пустую коллекцию с уникальными значениями.
// 3. Приведите в порядок клиентов с учётом следующих правил:
//    * Клиенты хранятся в коллекции из пункта 2
//    * Не должно быть повторяющихся ФИО клиентов вне зависимости от регистра
//    * Имя, фамилия и отчество должны быть написаны в нижнем регистре
// 4. Выведите количество клиентов и финальный список в консоль в отсортированном порядке от А до Я (по фамилии)
// 5*. (доп.задание) Имя, фамилия и отчество, которые хранятся в коллекции из пункта 2, должны начинаться с большой буквы (capitalized)
//
// ================= Solution =================== */

var clientCards = ["Яськов МИХАИЛ Николаевич", "Юрьев Надежда Павловна", "Иванченко Кирилл Анатольевич", "Васильев Жан Михайлович", "АФАНАСЬЕВ Жорж Борисович", "ЯСЬКОВ МИХАИЛ нИКОЛАЕВИЧ", "ЮРЬЕВ КИРИЛЛ ЭДУАРДОВИЧ", "Иванченко КИРИЛЛ АНАТОЛЬЕВИЧ", "ВАСИЛЬЕВ жан мИХАЙЛОВИЧ", "МИХАСЁВ ЮРИЙ Владимирович"]

var clientCards2: Set<String> = []
clientCards2.insert("Яськов МИХАИЛ Николаевич")
clientCards2.insert("Юрьев Надежда Павловна")
clientCards2.insert("Иванченко Кирилл Анатольевич")
clientCards2.insert("Васильев Жан Михайлович")
clientCards2.insert("АФАНАСЬЕВ Жорж Борисович")
clientCards2.insert("ЯСЬКОВ МИХАИЛ нИКОЛАЕВИЧ")
clientCards2.insert("ЮРЬЕВ КИРИЛЛ ЭДУАРДОВИЧ")
clientCards2.insert("Иванченко КИРИЛЛ АНАТОЛЬЕВИЧ")
clientCards2.insert("ВАСИЛЬЕВ жан мИХАЙЛОВИЧ")
clientCards2.insert("МИХАСЁВ ЮРИЙ Владимирович")
print(clientCards2)

var sortedclientCards2 = clientCards2.sorted()

//for client in clientCards2 {

for (index, value) in sortedclientCards2.enumerated() {
    print("Порядковый номер \(index + 1) : имя \(value).lowercased())") //subtracting
}

//    print("\(client.lowercased())")
//}

for client in sortedclientCards2 {
    print("\(client.capitalized)")
}



/*
 ===============================================
            Task 3: Материалы
 ===============================================
 1. Создайте перечисление материалов:
    - wood
    - metal
    - plastic
    - glass
    - paper
    - fabric
    - stone
 2. Создайте словарь с материалами из пункта 1 (дерево, металл, бумага, текстиль и камень), в котором значение - какая-то вещь из этого материала
 3. Удалите из словаря камень
 4. Добавьте в словарь пластик и стекло
 5. Выведите в консоль вещь из камня. Если вещи из камня не найдено, то выведите вещь из стекла
 6. Выведите все доступные материалы из перечисления в консоль
 7. Обновите вещь из стекла значением "Glass"
 8. Выведите все вещи из словаря в консоль, воспользовавшись параметром .values и циклом
 9. Получите рандомный элемент из словаря. Если количество букв вещи кратно 2, то удалите всё из словаря.

 ================= Solution =================== */
enum Materials {
    case wood, metal, plastic, glass, paper, fabric, stone
}

var dictionary: [Materials: String] = [Materials.wood: "стол", Materials.metal: "лестница", Materials.paper: "книга", Materials.fabric: "платье", Materials.stone: "дом"]

dictionary[Materials.stone] = nil   //удаление камня
dictionary[Materials.plastic] = "бутылка"   //добавление пластика
dictionary[Materials.glass] = "окно"    //добавление стекла
print(dictionary)

if let findStone = dictionary[Materials.stone] {
    print("Вещь из камня найдена - это \(findStone)")
} else {
    let findGlass = dictionary[Materials.glass]
    print("вещь из стекла \(String(describing: findGlass))")
}

dictionary    // Выведите все доступные материалы из перечисления в консоль

dictionary.updateValue("Glass", forKey: Materials.glass)
dictionary

for (index, value) in dictionary.enumerated() {
    print("Порядковый номер \(index + 1) : имя \(value)")
}

for (_,value) in dictionary {
    if value.count == 2{
        dictionary.removeAll()
        print(dictionary)
    }
}


/*
 ===============================================
            Task 4: Словарь с массивом
 ===============================================
 Разберитесь в написанном коде исходя из условий задачи:
 1. Студенты пишут тест. За первую попытку они получили оценки, которые представлены в `firstTestResults`
   Необходимо распарсить в словарь имена студентов и результаты теста
 2. Некоторые студенты решили пересдать тест, а ещё были хитрые студенты, которые решили поменять свои имена и написать тест с чистого листа. Результаты представлены в `secondTestResults`
Добавьте результаты второй попытки в словарь `studentResults`, приняв во внимание, что результаты студентов, которые не были в первом списке, в словарь не добавляются.

 Вам необходимо:
 1) Ответить на вопрос почему код, написанный на строчке 103, не выполняет требования первого пункта.
 2) Дописать код второго пункта так, чтобы программа выполняла то, что требуется в задании.


 ================= Solution =================== */

var firstTestResults: [String: Int] = ["Vasya": 1, "Ludmila": 7, "Oleg": 10, "Kuzma": 8, "Alesha": 5, "Michail": 5, "Aleksey": 3, "Lad": 4]

var studentResults: [String: [Int]] = [:]

for (key,value) in firstTestResults {
    if value >= 2{
        firstTestResults.removeValue(forKey: key)
        print(firstTestResults)
    }
}

studentResults

let secondTestResults = "Vasya 7::Alesha 7::Michail 4::Aleksey 8::Ivan 7::Afanasiy 10:: Vadim 5"

for result in secondTestResults.components(separatedBy: "::") {
    let student = result.components(separatedBy: " ")
    if student.count >= 2, let mark = Int(student[1]) {
        studentResults[student[0]]?.append(mark)
//        studentResults.updateValue([mark], forKey: student[0])
    firstTestResults.isDisjoint(with: secondTestResults).sorted()
        // что сюда нужно добавить для успешного выполнения кода?
    }
}

studentResults


//
//let firstTestResults = "Vasya 1::Ludmila 7::Oleg 10::Kuzma 8::Alesha 5::Michail 5::Aleksey 3:: lad"
//
//var studentResults: [String: [Int]] = [:]
//for result in firstTestResults.components(separatedBy: "::") {
//    let student = result.components(separatedBy: " ")
//    if student.count >= 2, let mark = Int(student[1]) {
//        //        studentResults[student[0]]?.append(mark)
//        studentResults.updateValue([mark], forKey: student[0])
//    }
//}
//
//studentResults
//
//let secondTestResults = "Vasya 7::Alesha 7::Michail 4::Aleksey 8::Ivan 7::Afanasiy 10:: Vadim 5"
//
//for result in secondTestResults.components(separatedBy: "::") {
//    let student = result.components(separatedBy: " ")
//    if student.count >= 2, let mark = Int(student[1]) {
//        // что сюда нужно добавить для успешного выполнения кода?
//    }
//}
//
//studentResults
