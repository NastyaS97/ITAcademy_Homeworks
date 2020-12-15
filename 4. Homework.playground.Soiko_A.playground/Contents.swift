import UIKit

// В файле представлено 6 заданий. 7 задание дополнительное, выполнение которого даст вам плюс к оценке (если такое потребуется).
// Решение писать после заголовка "Solution" каждого задания, удалив комментарий // ...
// Готовое домашнее задание в этот раз будем загружать на гитхаб
// Подробнее про сдачу домашки расскажу на занятии в четверг


/*
 ===============================================
            Task 1: Выстрелы в мишень
 ===============================================

 1. Игрок стреляет в мишень. Каждый выстрел состоит из номера попытки, сообщения "SHOT!" и результата (от 0 до 10 очков). См. пример shot
 2. Напишите программу, которая делает 10 выстрелов и находит общее количество выбитых очков
 3. Очки за выстрел начисляются следующим образом:
 • если игрок промахнулся (0), то в консоль выводится сообщение о промахе и от общего результата отнимается 1 штрафной балл.
 • если игрок попал в сектор от 1 до 5 и это нечетный выстрел, то результат выстрела увеличивается на 20%
 • если игрок попал в сектор от 6 до 10 и это четный выстрел, то результат выстрела увеличивается на 30%
 • если это 7 попытка, то у игрока отнимается 1 балл от общего результата
 • во всех остальных случаях количество очков за выстрел остаётся неизменным
 4. В каждом условии выведите в консоль номер выстрела, сообщение, очки за выстрел и общий результат.

 ================= Solution =================== */

//var shot = (attempt: 1, message: "SHOT!", score: Int.random(in: 0...10))
//var attemp = 10
//repeat {
//    var score = Int()
//    for (var attempt, var message, var score) in shot {
//        score += Int.random(in:0...9)
//    }
//    print("SHOT!")
//    attemp -= 1
//} while attemp > 0
//
//print(attemp)
//

var shot = (attempt: 1, message: "SHOT!", score: Int.random(in: 0...10))
var sumOfScore: Float = 0
for _ in (1...10) {
  if shot.attempt == 7 {
    sumOfScore = sumOfScore + Float(shot.score) - 1
  } else if shot.score >= 1 && shot.score <= 5 && shot.attempt % 2 == 1 {
    sumOfScore = sumOfScore + Float(shot.score) * 1.2
  } else if shot.score >= 6 && shot.score <= 10 && shot.attempt % 2 == 1 {
    sumOfScore = sumOfScore + Float(shot.score) * 1.3
  } else if shot.score == 0 {
    sumOfScore = sumOfScore - 1
    print("Мимо")
  } else {
    sumOfScore = sumOfScore + Float(shot.score)
  }
  print("Попытка была \(shot.attempt), \(shot.message) score равен \(shot.score), total score \(sumOfScore)")
  shot.attempt = shot.attempt + 1
  shot.score = Int.random(in: 0...10)
}

///*
// ===============================================
//            Task 2: Color localization
//          Задание 5 из аудиторного урока
// ===============================================
//
// 1. Добавьте в перечисление цветов из задания 4 (делали в классе) связанные значение на русском языке.
// 2. Создайте 2 цвета на ваш выбор.
// 3. Выведите в консоль созданные цвета с русскими значением.
//
// ================= Solution =================== */


enum Colors: String {
    case red = "красный"
    case blue = "голубой"
    case yellow = "желтый"
    case green = "зеленый"
    case purple = "пурпурный"
    case black = "черный"
}
var color: Colors = Colors.green
color = .yellow

let firstColor = Colors.purple
firstColor.rawValue
print("\(firstColor) is \(firstColor.rawValue)")

let secondColor = Colors.black
secondColor.rawValue
print("\(secondColor) is \(secondColor.rawValue)")

/*
 ===============================================
 Task 3: Color localization
 Задание 6 из аудиторного урока
 ===============================================
 
 1. Создайте перечисление с названиями месяцев
 2. Задайте им целочисленные связанные значения
 3. Отсчёт начните с 10
 4. Создайте переменные с 3 месяцами: месяц вашего дня рождения, любимый и нелюбимый месяц
 
 ================= Solution =================== */

enum Month: Int {
    case january = 10
    case february = 11
    case march = 12
    case april = 13
    case may = 14
    case june = 15
    case july = 16
    case augast = 17
    case september = 18
    case october = 19
    case november = 20
    case december = 21
}

let myBirthdayMonth = Month.july
print("Мой месяй рождения \(myBirthdayMonth) под номером \(myBirthdayMonth.rawValue)")

let hateMonth = Month.november
print("Мой самый нелюбимый месяц \(hateMonth) под номером \(hateMonth.rawValue)")

let favoriteMonth = Month.april
print("Мой самый любимый месяц \(favoriteMonth) под номером \(favoriteMonth.rawValue)")

/*
 ===============================================
            Task 4: Server response
 ===============================================

 1. С сервера приходят три параметра:
 - statusCode. в диапазоне от 200 до 500
 - message (сообщение с успешным ответом)
 - errorMessage (сообщение с неуспешным ответом)
 2. Необходимо создать tuple со всеми приходящими параметрами
 3. Создайте 2 тьюпла с серверным ответом в которых:
 - значения параметров сначала создаёте в переменных, а уже потом используете в тьюпле
 - значения параметров задаёте при создании тьюпла
 4. Напишите программу, в которой:
 - Если statusCode от 200 до 300 включительно, то в консоль выводится message.
 - Если статус код 404, то замените errorMessage на любое другое сообщение
 - Для остальных кодов выведите в консоль errorMessage (воспользуйтесь switch case)


 ================= Solution =================== */
let statusCode = Int.random(in: 200..<500)
var message: String = "OK"
var errorMessage: String = "Not OK"

let threePoint2 = (statusCode, message, errorMessage)
switch threePoint2 {
case let(statusCode, _, _) where statusCode > 200 && statusCode <= 300:
    print(message)
case let(statusCode, _, _) where statusCode == 404:
    print(errorMessage)
default:
    print(errorMessage)
}

let okMessage: (Int, String) = (statusCode, message) //  ззначения параметров сначала создаёте в переменных, а уже потом используете в тьюпле
let notOkMessage: (Int, String) = (statusCode, errorMessage) // значения параметров сначала создаёте в переменных, а уже потом используете в тьюпле

let okMessage2: (Int, String) = (statusCode: Int.random(in: 200..<500), message: "OK") // значения параметров задаёте при создании тьюпла
let notOkMessage2: (Int, String) = (statusCode: Int.random(in: 200..<500), message: "Not OK") // значения параметров задаёте при создании тьюпла

let threePoint: (Int, String, String) = (statusCode: Int.random(in: 200..<500), message: "OK", errorMessage: "Not OK") //  создать tuple со всеми приходящими параметрами




/*
 ===============================================
            Task 5: Restaurant list
 ===============================================

 1. Создайте перечисление с вашими любимыми кафе, ресторанами и прочими едальнями.
 2. Если у этого заведения есть альтернативное название (пр: McDonalds = мак), то присвойте его каждому заведению в виде связанного строкового значения. Если нет, то оставьте имя заведения по умолчанию
 3. Создайте топ 3 заведения из вашего списка
 4. Выведите в консоль название этих заведений, воспользовавшись rawValue

 ================= Solution =================== */
enum Cafe: String {
    case Свободычетыре = "Svobody4"
    case Штолле = "Stolle"
    case Гараж = "Garage"
    case Union
    case Zavtraki24
    case Темпо
    case мак = "McDonalds"
}

enum TopCafe: String {
    case Zavtraki24 = "номер два"
    case Темпо = "номер три"
    case мак = "номер один"
}
var firstPlace = TopCafe.мак
firstPlace.rawValue
    
var secondPlace = TopCafe.Zavtraki24
secondPlace.rawValue

var thirdPlace = TopCafe.Темпо
thirdPlace.rawValue

print("Мой список топ 3 заведений: \(thirdPlace) is \(thirdPlace.rawValue),\(secondPlace) is \(secondPlace.rawValue), \(firstPlace) is \(firstPlace.rawValue)")



/*
 ===============================================
            Task 6: iStore
 ===============================================

 1. Создайте перечисление с устройствами от Apple (телефоны, ноутбуки, колонки, часы и т.д.)
 2. Задайте каждому устройству связанное целочисленное значение в виде примерной цены в долларах
 3. Создайте tuple customer, у которого есть имя и какая-то сумма, на которую он бы хотел купить что-то в вашем магазине
 4. Если сумма, названая покупателем, совпадает со связанным значением какого-нибудь устройства, то обратитесь к покупателю по имени и настойчиво предложите ему купить это устройство.
    Для данного пункта воспользуйтесь инициализацией перечисления через rawValue
 5. Если устройства на эту сумму не нашлось, то вежливо попросите покупателя зайти попозже
 (Примите во внимание, что у покупателя должна быть именно точная сумма покупки. Случаи, когда у покупателя больше денег - не обрабатывайте)

 ================= Solution =================== */

let name: String = "Angelina"
let price: Int = 999

enum Istore: Int {
    case AppleWatchSE = 279
    case AppleWatchSeries = 199
    case iPadAir = 599
    case iPadPro = 799
    case iPhone12Pro = 999
    case iPhone12 = 699
    case macBookPro = 1299
    case macMini = 698
}
var AppleWatchSE1 = Istore.AppleWatchSE
AppleWatchSE1.rawValue

var AppleWatchSeries1 = Istore.AppleWatchSeries
AppleWatchSeries1.rawValue

var iPadAir1 = Istore.iPadAir
iPadAir1.rawValue

var iPadPro1 = Istore.iPadPro
iPadPro1.rawValue

var iPhone12Pro = Istore.iPhone12Pro
iPhone12Pro.rawValue

var iPhone121 = Istore.iPhone12
iPhone121.rawValue

var macBookPro1 = Istore.macBookPro
macBookPro1.rawValue

var macMini1 = Istore.macMini
macMini1.rawValue

var forByer = (name: "Angelina", price: Int.random(in: 279..<1299))
switch forByer {
case let(name, price) where price == 999:
    print("\(name), это отличный вариант для Вас. Убедительно настаиваю на приобретении.")
default:
    print("Not OK")
}




/*
 ===============================================
            Task 7: iStore Pro*
 ! Задача со звездочкой не обязательна к решению. !
 ! Её решение сможет повысить оценку, если вы где-то ошиблись !
 ===============================================

 1. Теперь покупатель из задачи 6 приходит к вам с запросом на покупку конкретного устройства (расширьте тьюпл)
 2. Если денег у покупателя хватает на это устройство (сумма больше или равна цене покупки), то продавайте его покупателю.
 3. Если денег не хватает на покупку того, что хотел покупатель, то предложите другое устройство (логика из задачи номер 6)

 ================= Solution =================== */
