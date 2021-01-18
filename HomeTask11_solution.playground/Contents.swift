import UIKit
//
//
//    ===============================================
//          Task 1 (Задание 3 из плэйграунда)
//    ===============================================
//
//    1. Реализуйте класс Ученик, у которого есть:
//     - Массив оценок по предметам (от 1 до 10)
//     - Коэффициент - параметр, по которому будет производиться расчет суммы на карманные расходы (по умолчанию - 10)
//     - Средняя оценка: Readonly computed property
//     - Карманные деньги: Computed property. Вычисляется на основе средней оценки, умноженной на коэффециент
//    2. Если параметру карманные деньги присваивается новое значение, должен выполняться перерасчёт коэффициента
//    3. Создайте экземпляр класса ученик. Выведите в консоль его среднюю оценку и карманные деньги (напишите для этого функцию в классе ученик).
//    4. Измените коэффециент на 15 и выведите карманные деньги.
//    5. Дайте ученику 500 единиц карманных денег и выведите коэффециент.
//
//    ===============================================
//                    Solution

class Student {
    
    var marks: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9 ,10]
    var parametrOfPocketBudket = 10
    
    var avarageMark: Int {   //Readonly computed property (значение без set)
        get {
            var total = 0
            for mark in marks {
                total += mark
            }
            let marksTotal = marks.count
            let averageMarks = total/marksTotal
            return averageMarks
        }
    }
    
    var pocketMoney: Int {
        
        get {
            return avarageMark * parametrOfPocketBudket
        }
        set {
            if newValue >= pocketMoney {
                avarageMark * parametrOfPocketBudket
            }
        }
    }
    func printInfo() {
        print("""
            Средняя оценка - \(self.avarageMark)
            Карманные деньги - \(self.pocketMoney)")
            """)
    }
}

let student = Student()
student.printInfo

student.parametrOfPocketBudket = 10
student.pocketMoney

student.pocketMoney = 500
student.parametrOfPocketBudket


//    ===============================================
//                          Task 2
//    ===============================================
//
//    1. Создайте перечисление с марками автомобиля (Опель / Мерседес / Тойота и т.д.).
//    2. Добавьте в перечисление функции, которые возвращают русские и белорусские названия марок автомобилей.
//    3. Создайте класс автомобиль со следующими свойствами:
//      - марка
//      - тип топлива (бензин / дизель / газ / гибрид). Вложенное перечисление в класс автомобиль. По умолчанию бензин.
//      - КПП (ручная / автоматическая). Вложенное перечислениие в класс автомобиль.
//      - максимальный объем топлива
//      - текущее количество топлива.
//      - свободное место в баке. Вычисляемое значение (максимальное - текущее)
//      - владелец автомобиля. Опционал
//    4. Добавьте следующие функции в класс автомобиль:
//      - залить топливо. Принимает литры. Если свободного места в баке нет, то выполните ранний выход из функции не заливая топливо в бак. Иначе пополните бак.
//      - купить автомобиль. Принимает в виде аргумента того, кто покупает автомобиль.
//      Если владелец уже есть, то выполните ранниий выход из функции.
//      Иначе продайте автомобиль и залейте топливо в автомобиль до максимального уровня.
//    5. Создайте класс-фабрику, которая производит автомобили. У неё есть следующие свойства:
//      - словарь автомобилей, которые фабрика произвела, где ключ - марка автомобиля, а значение - массив автомобилей.
//      - массив всех марок автомобилей. Ленивая переменная
//      - количество топлива в машинах. Вычисляемая переменная. Возвращает сумму топлива, которое заливо в машинах. Если устанавливаем значением, то топливо равномерно заливается в те машины, у которых нет владельца.
//    6. Добавьте в фабрику следующие функции:
//      - произвести автомобиль. Принимает марку автомобиля и количество. Производит автомобили (создаёт экземпляр класса) и добавляет в словарь автомобилей.
//      - купить автомобиль. Принимает будущего владельца и марку. Если марка не указана, то выберите случайный автомобиль из массива всех марок и продайте его будущему владелцу. Если автомобиля такой марки нет, то создайте его. Не забудьте вызвать функцию покупки у самого автомобиля.
//    7. Создайте фабрику и произведите автомобили разных марок и разного количества.
//    Купите некоторые автомобили.
//    Залейте в случайный опель 20 литров топлива.
//    Выведите количество топлива в машинах.
//    Увеличьте количества топлива в машинах.
//    ===============================================
//                    Solution


enum ModelsOfCars: String {
    case audi
    case bmw
    case bugatti
    
    func getRussianName() -> String {
        switch self {
        case .audi:
            return "ауди"
        case .bmw:
            return "бмв"
        case .bugatti:
            return "бугатти"
        default:
            return "нет имени"
        }
    }
    
    func getBelarussianName() -> String {
        switch self {
        case .audi:
            return "аудi"
        case .bmw:
            return "бмвэ"
        case .bugatti:
            return "бугацi"
        default:
            return "няма назвы"
        }
    }
}


class Auto {
    
    enum Fuel {
        case petrol
        case diesel
        case gas
        case hybrid
    }
    
    enum Transmission {
        case automatic
        case mechanical
    }
    
    let model: ModelsOfCars
    var fuelOfCars = Fuel.petrol
    let transmissionOfCars: Transmission
    var maxVolume = 55
    var currentVolumeOfFuel = 23
    var ownerOfCars: String?
    
    var freeVolume: Int {
        get {
            return maxVolume - currentVolumeOfFuel
        }
        set(newValue) {
            self.freeVolume = maxVolume - newValue
        }
    }
    
    func addTheFuel (litrs: Int) -> Int {
        guard self.freeVolume > litrs || self.freeVolume > 0 else { return 0 }
        
        self.freeVolume + litrs
        return litrs
    }

    func buyTheCars(nameofBuyer: String?) -> String {
        guard let ownerOfCars = ownerOfCars, !ownerOfCars.isEmpty else { return "нет хозяина"}
        
        self.addTheFuel
        return nameofBuyer ?? "name"
    }

    init(model: ModelsOfCars, fuelOfCars: Fuel, transmissionOfCars: Transmission, maxVolume: Int, currentVolumeOfFuel: Int, ownerOfCars: String, freeVolume: Int) {
        self.model = model
        self.fuelOfCars = fuelOfCars
        self.transmissionOfCars = transmissionOfCars
        self.maxVolume = maxVolume
        self.currentVolumeOfFuel = currentVolumeOfFuel
        self.ownerOfCars = ownerOfCars
        self.freeVolume = freeVolume
    }
}


class Production {
    
    let model: ModelsOfCars
    var currentVolumeOfFuel = 23
    var ownerOfCars: String?
    var setOfAuto: [[ModelsOfCars]: [Auto]]
    lazy var modelOfAllCars: [ModelsOfCars]
    var ownerOfCars: String?
    
    var coutOfFuel: Int {
        get {
            self.coutOfFuel = self.currentVolumeOfFuel //сумма залитого топлива
        }
        set (addedFuel){
            var carsWithoutMasters: [Car] = []
            for cars in ModelsOfCars {
                for car in cars {
                    if car.ownerOfCars == nil {
                        carsWithoutMasters.append(car)
                    }
                }
            }
        }
    }

    var tuplesOfModels: ([ModelsOfCars], Int)
    
    
    init(currentVolumeOfFuel: Int, ownerOfCars: String?, setOfAuto: String, coutOfFuel: Int, tuplesOfModels: String) {
        
        self.model = ModelsOfCars.audi
        self.currentVolumeOfFuel = Int
        self.ownerOfCars = ownerOfCars?
        self.modelOfAllCars = [ModelsOfCars]
        self.setOfAuto = setOfAuto
        self.coutOfFuel = coutOfFuel
        self.tuplesOfModels = ([ModelsOfCars], Int)
    }
    
    
    func productionOfCars(ModelsOfCars, Int) {
        tuplesOfModels.append(tuplesOfModels).setOfAuto
    }
}

let newProduction = Production(currentVolumeOfFuel: 23, ownerOfCars: "Петя", setOfAuto: .bmw, coutOfFuel: 76)
newProduction.addTheFuel (litrs: 23)
newProduction.buyTheCars(nameofBuyer: "Иван Иванов")


        
//    ===============================================
//                        Task 3
//    ===============================================
//
//    1. Создайте класс счёт пользователя - Account
//    2. Добавьте следующие свойства:
//    - имя счета. Закройте приватностью setter.
//    - цвет иконки. Ленивая переменная. По умолчанию - фиолетовый. После изменения цвета выводит в консоль сообщение с какого на какой цвет поменялась иконка.
//    - флаг можно ли пополнять счет. Сделайте переменную недоступной извне.
//    - количество бонусов. Доступно только для чтения извне, в классе возможно изменить (подумайте какой уровень приватности установить).
//    Перед установкой нового значения бонусов, проверяйте флаг пополнения счета и включите его, если пополнение счёта недоступно.
//    - баланс. Воспользуйтесь property access level, который при установке значения выполняет проверку на отрицательное значение зачисляемых средств и флаг
//    доступности пополнения счета, а при возвращении значения добавляет к балансу бонусы.
//    3. Создайте следующие функции:
//    - изменение имени счета. Реализуйте проверку на пустоту и не совпадение имени с текущим счетом. Меняйте имя, только если проверки пройдены
//    - добавление бонусов. Выполните проверку на положительное значение и приплюсуйте новые бонусы к бонусам пользователя
//    - перерасчет бонусов. Приватная функция. Вызывается каждый раз, когда баланс меняется в сторону увеличения (добавьте didSet для приватной пары баланса).
//    Добавляет бонусы в размере 10% от текущего баланса пользователя (обратите внимание, что расчет 10% должен происходить от приватной stored property баланса).
//    Добавляйте бонусы за счет вызова функции `добавление бонусов`
//    - снять средства. Можно снять средства, только если запрошенная сумма меньше или равна балансу пользователя. Сначала снимаются бонусы, а затем деньги с основного баланса.
//    - закрыть счет. Устанавливает количество бонусов и баланс в 0, закрывает возможность пополнения счета.
//    4. Создайте счёт пользователя. Поменяйте имя счета, цвет иконки. Зачислите какую-нибудь сумму на счет. Узнайте, сколько бонусов на счету и какой текущий баланс.
//    Добавьте ещё денег на счет. Снимите 100 рублей и выведите количество бонусов и текущий баланс. Снимите все оставшиеся средства и закройте счёт.
//    ===============================================
//                    Solution

class Account {
    
    private(set) var nameOfAccount: String = ""
    
    lazy var color: UIColor = .purple {
        didSet (newColor) {
            print("Старый цвет иконки: \(self.color)  Новый цвет иконки: \(newColor)")
        }
    }
    
    fileprivate(set) var allowToEnlarge: Bool = true// недоступна извне
    
    func lock() {
        if !self.allowToEnlarge {
            self.allowToEnlarge == true
        }
    }
    
    private(set) var _countOfBonus: Int {
        
        get {
            return self._countOfBonus
        }
        set (newValue) {
            if allowToEnlarge == false {
                self.lock()
                self._countOfBonus = newValue
            }
        }
    }
    
    private var _balance: Int
    var balance: Int {
        get {
            return self._balance
        }
        set {
            if 0 < newValue && self.allowToEnlarge {
                self._balance = newValue + self._countOfBonus
                print("Новое установилось \(newValue)")
            }
        }
    }
    
    
    func changeTheNameOfAccount(name: String) -> String {
        if name.count != 0 || name != self.nameOfAccount {
        }
        return name
    }
    
    func getBonus(numb: Int) -> Int? {
        guard numb > 0 else { return 0 }
        
        self.balance += numb
        return numb
    }
    
//    fileprivate
    func increaseOfBalance() -> Int {
        if self.balance < self.balance {
        }
        let result = self.balance * Int(0.1) + self.balance
        return result
    }
    
    func withdrawFunds(n: Int) -> Int {
        guard n <= self.balance || self.balance == self.balance else { return 0 }
        
        let result2 = self.balance - self.increaseOfBalance() - n
        return result2
    }
        
    func closedTheAccount() {
        self._countOfBonus = 0
        self.balance = 0
        self.allowToEnlarge = false
    }
    
    init(nameOfAccount: String, color: UIColor, allowToEnlarge: Bool, countOfBonus: Int, balance: Int) {
        self.nameOfAccount = "NameOfAccount"
        self.color = .black
        self.allowToEnlarge = allowToEnlarge
        self._countOfBonus = countOfBonus
        self.balance = balance
    }
}


let myAccount = Account(nameOfAccount: "TopSecret", color: .purple, allowToEnlarge: true, countOfBonus: 20, balance: 600)

myAccount.changeTheNameOfAccount(name: "Not so secret")
myAccount.color = .black
myAccount.balance = 900
myAccount.getBonus(numb: 1700)
myAccount._countOfBonus
myAccount.balance

myAccount.balance = 1000
myAccount.withdrawFunds(n: 700)
myAccount._countOfBonus
myAccount.balance

myAccount.increaseOfBalance()
myAccount.closedTheAccount()



//    ===============================================
//                          Task 4
//    ===============================================
//
//    1. Реализуйте класс Vehicle:
//     - свойство maxSpeed
//     - свойство type - enum (motor, railed, waterСraft, airCraft)
//     - инициализатор со speed и type
//     - функция startMoving(). Сообщает в консоль, что транспортное средство начинает движение
//     - функция printInfo - выводит информацию о максимальной скорости, типе и имени транспортного средства
//     2. Создайте класс Car и Train, отнаследовав их от Vehicle
//     3. Добавьте в класс машины еще одно свойство - производителя (enum из 2 задания), а в класс поезда - количество посадочных мест.
//     4. В классе Car и Train создайте 3 инициализатора:
//     - пустой инициализатор, в котором установите значение производителя / количества посадочных мест по умолчанию и вызовите инициализатор супер-класса.
//     - инициализатор с аргументом производителя / количеством посадочных мест, вызовите инициализатор супер-класса
//     - инициализатор с аргументом производителя / количеством посадочных мест и аргументами speed и type. Вызовите инициализатор супер-класса
//     5. Переопределите функцию startMoving() в обоих классах, чтобы в каждом случае оно выводила какое транспортное средство начинает движение.
//     В классе машины вызовите суперкласс, а в классе поезда не вызывайте.
//     6. Создайте экземпляры класса транспортного средства, машины и поезда. Вызовите у всех функции startMoving() и printInfo()

//    ===============================================
//                    Solution

enum Type {
    case motor, railed, waterСraft, airCraft
}

class Vehicle {
    
    var maxSpeed: Int
    var type: Type
    
    
    init(maxSpeed: Int, type: Type) {
        self.maxSpeed = maxSpeed
        self.type = type
    }
    
    
    func startMoving() {
        print("Транспортное средcтво начинает движение")
    }
    
    
    func printInfo() {
        print("""
            \(self.maxSpeed)
            \(self.type).
            """)
    }
}

class Car: Vehicle {
    var manufacturer: ModelsOfCars
    
    
    init() {
        self.manufacturer = ModelsOfCars.audi
        super.init(maxSpeed: 60, type: .motor)
    }
    
    
    init(manufacturer: ModelsOfCars) {
        self.manufacturer = ModelsOfCars.bmw
        super.init(maxSpeed: 60, type: .motor)
    }
    
    
    init(manufacturer: ModelsOfCars , maxSpeed: Int, type: Type) {
        self.manufacturer = ModelsOfCars.bugatti
        super.init(maxSpeed: 60, type: .motor)
    }
    
    
    override func startMoving() {
        super.startMoving()
        print("\(Car.init(manufacturer: .bmw, maxSpeed: 140, type: .motor)) Транспортное средcтво начинает движение в переопределенной функции")
    }
}
    
class Train: Vehicle {
    var numberOfSeats: Int
    
    
    init() {
        self.numberOfSeats = 222
        super.init(maxSpeed: 80, type: .railed)
    }
    
    
    init(numberOfSeats: Int) {
        self.numberOfSeats = 222
        super.init(maxSpeed: 80, type: .railed)
    }
    
    
    init(numberOfSeats: Int, maxSpeed: Int, type: Type) {
        self.numberOfSeats = numberOfSeats
        super.init(maxSpeed: 80, type: .railed)
    }
    
    
    override func startMoving() {
        print("\(Car.init(manufacturer: .bugatti, maxSpeed: 190, type: .railed)) Транспортное средcтво начинает движение в переопределенной функции")
    }
}


let firstArgumentOfCar = Car(manufacturer: .audi, maxSpeed: 10, type: .motor)
firstArgumentOfCar.printInfo()
firstArgumentOfCar.startMoving()


let secondArgumentOfTrain = Train(numberOfSeats: 90, maxSpeed: 39, type: .railed)
secondArgumentOfTrain.printInfo()
secondArgumentOfTrain.startMoving()


//    ===============================================
//                          Task 5
//    ===============================================
//
//    1. Создайте класс Building. Добавьте в него следующие свойства, функции и нужные инициализаторы:
//    - материал (перечисление). Невозможно переопределить в дочерних классах
//    - цвет. сделайте переменную приватной на изменения
//    - стоимость
//    - дата постройки (год). невозможно изменить
//    - функция вывода информации о строении
//    - функция перекрасить. меняет цвет строения
//    2. Создайте класс ApartmentBuilding, отнаследовав его от Building. Добавьте в него следующие свойства и функции:
//    - количество квартир
//    - инициализатор с количеством квартир
//    - инициализатор с количеством квартир и остальными свойствами суперкласса
//    - переопределите свойство стоимости, которое при вычитывании значения увеличивает стоимость здания на 10% (в дочернем классе сделать из stored property - computed property)
//    - переопределите функцию перекрасить. Теперь она перекрашивает дом во все цвета, кроме розового.
//    - переопределите функцию вывода информации о строении. Она вызывает реализацию суперкласса и добавляет ещё информацию о количестве квартир.
//    3. Создайте класс Cottage, отнаследовав его от Building. Добавьте в него следующее:
//    - флаг находится ли коттедж в городской или сельской местности. Сделайте сеттер приватным. Невозможно переопределить в дочерних классах.
//    - переопределите свойство цвета, добавив в него didSet, который выводит информацию о старом цвете дома и его новом цвете.
//    - переопределите свойство стоимости, которое при вычитывании значения увеличивает стоимость здания на 7%, если оно в сельской местности, и на 15%, если в городской
//    - переопределите функцию вывода информации о строении. Она выводит информацию о местности коттеджа и его стоимости. Не вызывайте реализацию родительского класса.
//    - создайте функцию затопить печь, которая включает печь, только если коттедж находится в сельской местности. Функция недоступна к переопределению в дочернем классе.
//    - добавьте инициализаторы, если необходимо
//    4. Создайте класс SummerCottage, отнаследовав его от Cottage. Сделайте так, чтобы от класса нельзя было наследоваться.
//    - добавьте флаг арендован ли коттедж.
//    - добавьте инициализатор
//    - переопределите функцию перекрасить. Строение вообще невозможно перекрасить
//    - переопределите свойство стоимости, которое при вычитывании значения увеличивает стоимость здания на 20%
//

public class Building {
    
    enum Material {
        case metal, silver, wood
    }
    
    final var material: Material
    
    var color: UIColor
    
    private(set) var price: Int
    
    final var yearOfBuildin: String
    
    
    init(material: Material, color: UIColor, price: Int, yearOfBuildin: String) {
        self.material = Material.metal
        self.color = .blue
        self.price = price
        self.yearOfBuildin = yearOfBuildin
    }
    
    
    func printInfoAboutBuilding() {
        print("""
            \(self.material)
            \(self.color)
            \(self.price)
            \(self.yearOfBuildin).
            """)
    }
    
    
    func changeColor(color: UIColor) {
        self.color = color
    }
}


class ApartmentBuilding: Building {
    
    var numberOfFlats: Int
    
    init(numberOfFlats: Int) {
        self.numberOfFlats = numberOfFlats
    }
    
    
    init(numberOfFlats: Int, material: Material, color: UIColor, price: Int, yearOfBuildin: String) {
        self.numberOfFlats = numberOfFlats
        super.init(material: material, color: color, price: price, yearOfBuildin: yearOfBuildin)
    }
    
    
    override var price: Int {
        get {
            return super.price * Int(0.1) + super.price
        }
    }
    
    func changeColor(color: UIColor) -> UIColor {
        guard super.color != .systemPink else { return .brown }
        super.color = color
        return color
    }
    
    
    override func printInfoAboutBuilding() {
        print("""
            \(super.material)
            \(super.color)
            \(super.price)
            \(self.numberOfFlats).
            """)
    }
}

class Cottage: Building {
    
    var whereTheCottageIs: String {
        get {
            return "city"
        }
        set(newValue) {
            newValue == "village"
        }
    }
    
    override var color: UIColor {
        didSet (newColor){
            print("Старый цвет: \(super.color)  Новый цвет: \(newColor)")
        }
    }
    
    func price(n: Int) -> Int {
        guard self.whereTheCottageIs == "city" else { return super.price * Int(0.15) + super.price }
        
        super.price * Int(0.15) + super.price
        return n
    }
    
    override func printInfoAboutBuilding() {
        print("""
            \(self.whereTheCottageIs)
            \(self.price)
            """)
    }
    
    private func burn() {
        if self.whereTheCottageIs == "village" {
            print("Печь затоплена")
        }
    }
}

class SummerCottage: Cottage {
    var isTheCottageRent: Bool
    
    init(isTheCottageRent: Bool) {
        self.isTheCottageRent = isTheCottageRent
    }
    
    final override func changeColor(color: UIColor) {
        super.color = color
    }
    
    override func price(n: Int) -> Int {
        guard super.whereTheCottageIs == "city" else { return super.price * Int(0.20) + super.price }
        
        super.price * Int(0.20) + super.price
        return n
    }
}


