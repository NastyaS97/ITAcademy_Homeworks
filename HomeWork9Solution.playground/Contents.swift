import UIKit

var str = "Hello, playground"
//    ===============================================
//               Task 1: Breath in & out
//    ===============================================
//    1. Реализуйте 2 функции Вдох и Выдох, которые выводят в консоль текстовое описание своего действия.
//    2. Реализуйте функцию, которая позволит человеку дышать на протяжении всего времени жизни
//    Время жизни передается в качестве аргумента типа Int.
//
//    ================= Solution ====================

func breathIn(firstMove: String) {
    print("Каждый отдельный впуск воздуха в легкие, каждое отдельное вдыхание - это \(firstMove).")
}
breathIn(firstMove: "вдох")

func breathOut(secondMove: String) {
    print("Каждое отдельное выталкивание воздуха из легких, каждое отдельное выдыхание - это \(secondMove).")
}
breathOut(secondMove: "выдох")


func breathInDuringAllLife(firstArgument: String) {
    var age = 66
    for age in firstArgument {
        print(firstArgument)
    }
}
breathInDuringAllLife(firstArgument: "Каждый отдельный впуск воздуха в легкие, каждое отдельное вдыхание")




//    ===============================================
//               Task 2: Массив чисел
//    ===============================================
//    1. Написать функцию, возвращающую массив случайных целых чисел, которая принимает 2 параметра:
//       1) size: целое число от 1 до 50 с дефолтным значением, равным 27.  Использовать ярлык аргумента with
//       2) range: опциональный tuple с двумя целыми числами и названиями from, to. Задать тьюплу значение по умолчанию, равное nil.
//    2. Диапазон случайного числа определяется значениями тьюпла range (from, to). Необходимо развернуть их, применив optional chaining. Если не удаётся развернуть, то, воспользовавшись nil-coalescing operator, установить переменную from = -125, а to = 125.
//    3. Вызвать функцию 3 раза и вывести получившиеся массивы чисел в консоль.
//
//    ================= Solution ====================

//func randomNumberInArray(with size: Int = Int.random(in: 1...50),
//                         range: (Int, Int)? = nil) -> [(Int, Int)] {
//

func randomNumberInArray (with size: Int = 27,
                          range: (from: Int, to: Int)? = nil) -> [Int] {
    let rangeFrom = range?.from ?? -125
    let rangeTo = range?.to ?? 125
    var array: [Int] = []
    if size >= 1 && size <= 50 {
        for _ in 1...size {
            let randomNumber = Int.random(in: rangeFrom...rangeTo)
            array += [randomNumber]
        }
        print(array)
        return array
    } else {
        print(array)
        return array
    }
}
randomNumberInArray()

//    ===============================================
//               Task 3: Палиндром
//    ===============================================
//    1. Реализуйте функцию, которая будет проверять, является ли переданное слово палиндромом (примеры: «комок», «ротор») и возвращать результат в виде булевского значения.
//    2. Если слово пустое, либо содержит символы, то возвращайте nil.
//    3. Программа должна быть регистронезависимой.
//
//    ================= Solution ====================

func isPolindrom(word: String) -> Bool {
    let reverseString = String(word.reversed())
    if(word != "" && word == reverseString) {
        return true
    } else {
        return false
    }
}
print(isPolindrom(word: "madam"))


//    ===============================================
//               Task 4: Фабрика Apple
//    ===============================================
//    1. Создайте перечисление с  Apple гаджетами (айфон, айпад, макбук и т.д.)
//    2. Создайте функцию calculateOrderTime с аргументами:
//       - количество работников
//       - тип устройства
//       - количество устройств
//       Функция возвращает опциональное время заказа (дни)
//       Внутри функции рассчитайте время заказа, которое вычисляется по формулу: количество устройств / количество работников * скорость работника.
//       Скорость работника определяется в зависимости от типа устройства:
//       * айфон: 5 устройств в день
//       * айпад: 3 устройства в день
//       * макбук: 1.5 устройства в день
//       Для других устройств задайте скорость работника на ваш взгляд.
//       Полученное время заказа округлите в большую сторону до целого положительного числа (минимум 1 день).
//       Обратите внимание, что если количество работников меньше или равно 0, либо количество устройств 0, то функция возвращает nil.
//    3. Создайте функцию build, которая принимает следующие аргументы:
//       - тип устройства: перечисление из п.1. Опустите ярлык аргумента
//       - количество устройств. Значение по умолчанию = 5000
//       - флаг срочности заказа. По умолчанию = false
//       Создайте переменную со случайным количеством работников (максимум 50)
//       Получите время выполнения заказа, вызвав функцию calculateOrderTime внутри функции build. Обратите внимание, что в функцию calculateOrderTime необходимо передать нужные аргументы. Результат вызова функции calculateOrderTime запишите в переменную orderTime.
//       Если заказ срочный, то время заказа уменьшите на 20% (минимум 1 день)
//       Функция возвращает тьюпл, состоящий из времени заказа, типа устройства и количества устройств.
//    4. Вызовите функцию build с разными вариациями количества аргументов.
//
//    ================= Solution ====================

enum Devices {
    case iMac27
    case iPhoneXR
    case MacBookAir13
    case iPadAir4
}


func calculateOrderTime(numberOfPersons: Int,
                        tupeOfDevice: String,
                        numbersOfDevices: Int) -> (Int)? {
    var speedOfPersons = 0.0
    if tupeOfDevice == "айпад" {
        speedOfPersons = 5
    } else if tupeOfDevice == "айпад" {
        speedOfPersons = 3
    } else if tupeOfDevice == "макбук" {
        speedOfPersons = 1.5
    } else {
        speedOfPersons == 4
    }
    let timeOfOrder = Double(numbersOfDevices) / Double(numberOfPersons) * speedOfPersons
    if  numberOfPersons <= 0 || numbersOfDevices == 0 {
        return nil
    } else {
        return Int(timeOfOrder)
    }
}
calculateOrderTime(numberOfPersons: 23, tupeOfDevice: "айпад", numbersOfDevices: 5)

func build(_ tupeOfDevice: Devices,
           numbersOfDevices: Int = 5000,
           flag: Bool = false) -> ((Int), Devices.Type, Int) {
    let randomNumberOfPersons = Int.random(in: 0...50)
    let orderTime = calculateOrderTime(numberOfPersons: 27, tupeOfDevice: "макбук", numbersOfDevices: 8) ?? 1
    if flag == true,
       let orderTimeWithBool = (1.0 * 0.8 / 1.0) {
        return (Int(orderTimeWithBool), Devices.self, numbersOfDevices)
    } else {
        return (orderTime, Devices.self, numbersOfDevices)
    }
}
build(Devices.MacBookAir13)
build(Devices.iMac27, numbersOfDevices: 23, flag: true)
