import UIKit

// В файле представлено 5 заданий.
// Решение писать после заголовка "Solution" каждого задания, удалив комментарий // ...
// Готовое домашнее задание закоммитить и отправить на ветку 5hometaskUnreviewed удаленного репозитория
// Отправить реквест на ветку 5hometask

/*
 ===============================================
 Task 1: Немного о вас
 ===============================================
 
 1. Создайте перечисление вещей, людей или событий, которые вас вдохновляют.
 2. Выведите все вещи в консоль с помощью CaseIterable.
 3. Напишите switch case по перечислению вдохновляющих вещей (для этого понадобится создать какую-то одну вещь). В каждом case выведите в консоль сообщение с объяснением, почему именно это вас вдохновляет.
 4. Объедините несколько case через запятую
 5. Реализуйте кейс по умолчанию для тех вещей, которые не хочется объяснять.
 
 ================= Solution =================== */

enum Motivation: CaseIterable {
    case работа, справедливость, развитие, пландействий
}

print("There are \(Motivation.allCases)")

let motivation: Motivation = .работа

switch motivation {
case .работа:
    print("Сложности в работе — это ведь всегда, в определенном смысле, вызов. А смогу? А если так? Гораздо хуже, когда я НЕ сталкиваюсь с трудностями.")
case .справедливость:
    print("Без справедливость отпадает мотивация к работе")
case .развитие:
    print("Чтобы идти в ногу со временем и быть успешным, надо развиваться")
case .пландействий:
    print("Без четкого плана есть вероятность зайти не туда")
}

/*
 ===============================================
 Task 2: Optional binding
 ===============================================
 
 1. Объявите опциональную переменную типа Int.
 2. Подкиньте монетку (Bool.random()). Если значение монетки true, то присвойте переменной любое число. В противном случае оставьте опционал пустым.
 3. Воспользовавшись optional binding, разверните переменную и выведите в консоль её значение. Если не удалось развернуть, то выведите в консоль случайное число от 1 до 100.
 
 ================= Solution =================== */

//func checkValue() -> String {
//    let table: String? = nil
//    guard let yourTable: String = table else { return "Error" }
//
//    print(yourTable)
//    return yourTable
//}

var serverResponseCode: Int?
var checkOnBoolean = Bool.random()

if checkOnBoolean {
    serverResponseCode = 36
} else {
    serverResponseCode = nil
}

if let serverResponseCode = serverResponseCode {
    print(serverResponseCode)
} else {
    print(Int.random(in: 1...100))
}


/*
 ===============================================
 Task 3: Nil-coalescing operator
 ===============================================
 
 1. Вам дан массив numbers, но в виде строк
 2. Воспользовавшись for in / forEach, приведите каждую строку к типу Int (создайте переменную типа Int в каждой итерации, в которую будете записывать результат приведения)
 3. Обратите внимание, что приведение из строкового литерала в числовой возвращает опциональное значение. Сделайте доработку, при которой если сконвертировать строку в число не удалось, то вы с помощью nil-coalescing operator устанавливаете значение числа по умолчанию, равное 0
 4. Выведите в консоль приведенные числа.
 
 ================= Solution =================== */

let numbers: [String] = ["1", "", "5", "ff5", "-25", "0 0.5"]

for numeric in numbers {
    if Int(numeric) == nil {
        let numeric = Int(numeric) ?? 0
        print(numeric)
    } else {
        print(numeric)
    }
}



/*
 ===============================================
 Task 4
 ===============================================
 
 1. Доработайте задачу из первого задания. Сделайте связанное значение для каждого элемента перечисления в виде целочисленной переменной, которая отражает уровень вдохновения (от 1 до 10)
 2. Доработайте switch case таким образом, что если уровень вдохновения меньше 4, то вы выводите в консоль новую случайную рандомную вещь (для этого вам потребуется обратиться к allCases.randomElement)
 3. Избавьтесь от опциональности рандомной вещи из пункта 2 двумя способами: с помощью nil-coalescing operator и с помощью optional binding.
 
 ================= Solution =================== */
enum Connect: Int, CaseIterable {
    case работа = 8
    case справедливость = 7
    case развитие = 9
    case пландействий = 6
}

let first: Connect?
let seconf: Connect = .пландействий

switch seconf {
case _ where Connect.работа.rawValue <= 4:
    first = Connect.allCases.randomElement()
case _ where Connect.справедливость.rawValue <= 4:
    first = Connect.allCases.randomElement()
case _ where Connect.развитие.rawValue <= 4:
    first = Connect.allCases.randomElement()
case _ where Connect.пландействий.rawValue <= 4:
    first = Connect.allCases.randomElement()
default:
    print("Жизнь не может быть скучна и безлика")
}

if let first = first {
    print(first)
} else {
    print("Ptonal binding not work")
}
var first1 = first ?? .справедливость
print(first1)


/*
 ===============================================
 Task 5: Авиа-диспетчер
 ===============================================
 
 1. Создайте перечисление Airport, в котором объявите 5-6 аэропортов и задайте каждому связанное значение в виде кода аэропорта. Выведите с помощью allCases названия всех аэропортов и их коды в консоль.
 2. Создайте перечисление гордов: Москва, Минск, Санкт-Петербург, Лондон, Орша, Вильнюс и Мозырь.
 Каждому городу, кроме Оршы и Мозыря, задайте ассоциированное значение в виде аэропорта из пункта 1.
 3. Сделайте вложенное перечисление в перечислении городов, которое будет отвечать за пассажиропоток. Оно может принимать следующие значения: hundreds, thousands, tenThousands, hundredThousands, zero. Задайте каждому case связанное значение в виде числового эквивалента пассажиропотока (hundreds = 100)
 4. Расширьте ассоциированные значения Москвы, Минска, Санкт-Петербурга и Лондона аргументом пассажиропотока города из предыдущего пункта.
 5. Для Москвы, Питера и Лондона введите ещё один ассоциированный аргумент в виде пассажиропотока самого аэропорта
 6. Создайте любой город на ваш выбор
 7. Напишите switch case, который выполняет следующую логику:
 • Если город Москва и пассажиропоток аэропорта больше, чем пассажиропоток города, то выведите в консоль сообщение, что аэропорт временно перенаправляет все рейсы в другой город (напишите это в консоль).
 • Если это Питер и пассажиропоток аэропорта от 10.000 до 100.000, то невзирая на пассажиропоток самого города, затребуйте дополнительные рейсы (напишите это в консоль).
 • Все рейсы в Оршу и Мозырь перенаправляйте на аэропорт Минска (напишите это в консоль).
 • Если пассажиропоток аэропорта Лондона равен 100.000, то отправляйте самолёты в Вильнюс (напишите это в консоль).
 • Для случаев, когда пассажиропоток Вильнюса равен 0, объявляйте в городе карантин (напишите это в консоль).
 • Во всех остальных случаях выведите в консоль информацию о том, что рейсы выполняются как обычно.
 
 ================= Solution =================== */

enum AirportCod: String, CaseIterable  {
    case AnaaAirport = "AAA"
    case ArraburyAirport = "AAB"
    case ElArishInternationalAirport = "AAC"
    case RabahBitatAirport = "AAE"
}

AirportCod.allCases.forEach { print($0, $0.rawValue) }

enum Города {
    enum CountOfPassangers: Int {
        case сто = 100
        case тысяча = 1000
        case десятьтысяч = 10000
        case стотысяч = 100000
        case ноль = 0
    }
    
    case moscow(airport: AirportCod, countOfPassangers: CountOfPassangers, countOfAirport: Int)
    case minsk(airport: AirportCod, countOfPassangers: CountOfPassangers)
    case saintPetersburg(airport: AirportCod, countOfPassangers: CountOfPassangers, countOfAirport: Int)
    case london(airport: AirportCod, countOfPassangers: CountOfPassangers, countOfAirport: Int)
    case vilnius(airport: AirportCod, countOfPassangers: CountOfPassangers)
    case мозырь
    case орша
}

var london: Города = .london(airport: .ArraburyAirport, countOfPassangers: .стотысяч, countOfAirport: 100000)

switch london {
case .moscow(_, let countOfPassangers, let countOfAirport) where countOfPassangers.rawValue < countOfAirport:
    print("аэропорт временно перенаправляет все рейсы в другой город")
case .saintPetersburg(_, _, let countOfAirport) where countOfAirport >= 10000 && countOfAirport <= 100000:
    print("невзирая на пассажиропоток самого города, требуем дополнительные рейсы")
case .мозырь, .орша:
    print("перенаправляем рейся на аэропорт Минска")
case .london(_, _, let countOfAirport) where countOfAirport == 100000:
    print("отправляем самолёты в Вильнюс")
case .vilnius(_, let countOfPassangers) where countOfPassangers.rawValue == 0:
    print("объявлем в городе карантин")
default:
    print("рейсы выполняются как обычно")
}


