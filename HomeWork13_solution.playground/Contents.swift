import UIKit

//import UIKit
//
//
//    ===============================================
//          Task 1 (Задание 2 из playGround)
//    ===============================================
//
//    Создайте функцию, которая принимает массив типа Cat и напишите логику, которая:
//     - считает количество CreepyCat в массиве
//     - если в массиве найден CuttieCat, то выводит в консоль его имя и уровень милоты
//     - если это объект HappyCat, то вызовите функцию getCatDescription
//     - возвращает массив котов, который состоит из котиков, не попавших под условия выше
//
//    Все классы, которые фигурируют в задаче, скопируйте в плэйграунд домашней работы из плэйграунда, с которым работали в классе.


class Cat {
    var name: String
    var voice: String = "Meow!"
    
    init(name: String) {
        self.name = name
    }
    
    func scream() {
        print(self.voice)
    }
    
    func getCatDescription() {
        print("I'm simple cat")
    }
}

class CreepyCat: Cat {
    var creepyLevel: Int
    
    init(creepyLevel: Int , name: String) {
        self.creepyLevel = creepyLevel
        super.init(name: name)
    }
}

let creepy = CreepyCat(creepyLevel: 1, name: "Creeps")
creepy.creepyLevel
creepy.voice
creepy.getCatDescription()
creepy.scream()

creepy.voice = "Bugaga"

creepy.voice

class HappyCat: Cat {
    override var voice: String {
        get {
            return "Prrrr"
        }
        set {
            super.voice = newValue
        }
    }
    
    override func getCatDescription() {
        print("I'm Happy cat")
    }
    
    override func scream() {
        super.scream()
        
        print("Do you like it?")
    }
}

class Python {
    
    static var averagePythonLengh: Int = 5
    static let pythonRussianName: String = "Питон"
    
    class var pythonVoice: String {
        return "Pfhhh"
    }
    
    
    var name: String
    var lenght: Int
    
    init(name: String, lenght: Int) {
        self.name = name
        self.lenght = lenght
    }
    
    class func say(word: String) {
        print(word)
    }
    
    static func hiss(word: String) {
        print("Pfhh" + word)
    }
}

let myPython: Python = Python(name: "Federich", lenght: 6)

myPython.lenght

Python.pythonRussianName

Python.pythonVoice
Python.say(word: "hi")
Python.hiss(word: "вот так")

Python.averagePythonLengh += 1

Python.averagePythonLengh

class LongPython: Python {
    override class var pythonVoice: String {
        return "Long pfhhh"
    }
    
    override class func say(word: String) {
        super.say(word: word)
        
        print("My length is 33 parrots")
    }
    
    static func increaseAveragePythonLenght() {
        self.averagePythonLengh += 1
        
        LongPython.averagePythonLengh += 1
    }
    
    func isMyPythonLong() -> Bool {
        return self.lenght > LongPython.averagePythonLengh
        //        return self.lenght > LongPython.averagePythonLengh
    }
}

class SingingCat: Cat {
    class var voiceOfCat: String {
        return "прекрасный голос"
    }
    
    static var catType: String = "кот необычно поющий"
    
    class func sing() {
        print(self.voiceOfCat)
        print ("\(voiceOfCat) которую он произносит")
    }
    
    static func countOfsingcat() -> Int {
        return Int.random(in: 0...100)
    }
}

class BadSingingCat: SingingCat {
    
    override class var voiceOfCat: String {
        return "новый голос"
    }
    
    override class func sing() {
        super.sing()
        
        print ("бла бла бла")
    }
}

class PlayfulCat: Cat {
    var playfulnessLevel: Int = 10
    override func getCatDescription() {
        print("This is a \(playfulnessLevel)% playful cat")
    }
    func play() {
        print("I played")
    }
}
class CuttieCat: Cat {
    var cutenessLevel: Int = 20
    override func getCatDescription() {
        print("This is a \(cutenessLevel)% cuttie cat")
    }
}
class VeryCuttieCat: CuttieCat {
}
let usualCat = Cat(name: "Boris")
let happyCat = HappyCat(name: "Vladimir")
let cuteCat = CuttieCat(name: "Leps")
let simpleCat = Cat(name: "Rox")
let creepyCat = CreepyCat(creepyLevel: 1, name: "Morphius")
let cats: [Cat] = [usualCat, happyCat, cuteCat, simpleCat, creepyCat]
print("BEGGINING OF CHECKING")

for cat in cats {
    let tempCheck = cat as? SingingCat
    if cat is PlayfulCat {
        print("I'm playful cat")
    } else if let cat = cat as? SingingCat {
        print(cat.voice)
    } else if let cat = cat as? CuttieCat {
        print(cat.cutenessLevel)
    } else {
        cat.getCatDescription()
    }
}

let pythons: [Python] = [
    Python(name: "Boris", lenght: 25),
    LongPython(name: "Vadim", lenght: 152)
]
pythons.forEach { $0.lenght }
var cat1: Cat = PlayfulCat(name: "Playful")


//    ===============================================
//                       Solution
//    ===============================================

var emptyArray: [Cat] = []

func buildArrayCatType(cats: [Cat]) -> [Cat] {
    
    var creappyCount = 0
    for cat in cats {
        if let cat = cat as? CuttieCat {
            print("имя кота \(cat.name) и уровень милоты \(cat.cutenessLevel)")
        } else if cat is HappyCat {
            cat.getCatDescription()
        } else if cat is CreepyCat{
            creappyCount += 1
            print(creappyCount)
        } else {
            emptyArray.append(cat)
        }
    }
    return emptyArray
}

buildArrayCatType(cats: cats)


//    ===============================================
//                           Task 2
//    ===============================================
//
//    1. Создайте базовый класс «Артист», у которого должны быть следующие свойства:
//    - имя: разрешить только чтение
//    - возраст: сделать проверку на положительное значение
//    - страна работы (Беларусь, Россия, Украина, Польша, Турция)
//    - стаж работы: проверка на положительные значения
//    - зарплата в неделю: артист может отказаться её озвучивать
//    - зарплата за день: вычисляемая переменная на основе зарплаты в неделю (с учетом того, что рабочая неделя - 5 дней)
//    - сколько процентов своей жизни работал артистом: вычисляемая переменная на основе данных возраста и стажа работы (подумайте, как вычислить)
//    - классовая переменная со средней зарплатой артиста
//    2. Добавьте 2 разных инициализатора (имя Артиста в каждом инициализаторе - обязательно)
//    3. Добавьте следующие методы:
//    - статический метод, возвращающий все возможные страны работы артиста. Сделать недоступным к переопределению
//    - статический метод, выводящий информацию о названии класса в консоль. Сделать доступным к переопределению в дочерних классах
//    - метод с информацией об артисте - выводит все свойства в читаемом виде. Недоступен к переопределению.
//    - метод «выступить», выводящий информацию об артисте, в каком жанре выступает и что показывает
//    4. Создать классы «Музыкант», «Художник», «Танцор», наследующиеся от артиста.
//    5. В каждом классе переопределить метод с информацией о классе, вызвав реализацию родителя и добавив описание дочернего класса. Добавить следующую логику каждому классу:
//    - Танцор отказывается выступать, если его зарплата за день меньше 100, о чем сообщает в консоль.
//    - Художник не хочет использовать своё родное имя, заменяя его на сценическое, которое состоит из перемешанных букв родного имени.
//    - Музыканты не хотят работать в Турции, уезжая в любую другую страну из списка доступных, а также у них появляется новый параметр - любимый инструмент.
//    6. Создать по два экземпляра каждого класса (в том числе родителя) с различными данными, положив их в массив типа Артист.
//    7. Пройтись по массиву и вызвать у каждого элемента метод выступить.
//    Если в списке попался Танцор, то вывести его зарплату за день, если Музыкант, то отобразить любимый инструмент.

//    ===============================================
//                      Task 3
//    ===============================================
//
//    1. Создать протокол BusinessTrip:
//    - статическая переменная - доступные страны. на чтение и на запись
//    - страна назначения. только на чтение
//    - продолжительность поездки. только на чтение
//    - флаг isCurrentlyInBusinessTrip. На чтение и на запись
//    - методы startTrip() endTrip()
//
//    2. Подчиниться протоколу BusinessTrip в классе Художник. Реализовать свойства и методы:
//    - художнику доступны для командировки Греция, Польша, Беларусь, Германия и Америка
//    - добавить инициализатор класса художник, который принимает страну назначения и продолжительность поездки
//    - добавить пустой инициализатор класса художник, который устанавливает рандомную страну назначения и рандомную продолжительнсть поездки.
//    - реализовать функцию начала поездки, которая начинают поездку в страну назначения только если она есть в списке доступных стран
//    - реализовать функцию конца поездки, которая выводит информацию о поездке: страна назначения, продолжительность.
//
//    3. Создать протокол PayableBusinessTrip, наследующийся от протокола BusinessTrip:
//    - salaryInBusinessTrip. Только на чтение
//    - salaryCoefficient. Только на чтение
//    - метод paySalary()
//
//    4. Подчиниться в классе Музыкант протоколу PayableBusinessTrip:
//    - salaryCoefficient зависит от стажа работы: 1-2 года - 1x, 3-5 лет - 1.5x, > 5 лет -  2x.
//    - salaryInBusinessTrip вычисляется на основе зарплаты за день (если артист отказался ее называть, то зарплата по умолчанию - 80), помноженной на salaryCoefficient
//    - paySalary() - выводит в консоль сумму, которую музыкант заработал за время командировки.
//    - музыкантам доступны для командировки Латвия, Литва, Польша, Германия и Италия.
//    - музыканты хотят работать только в Германии и Италии, поэтому отказываются ехать в другие страны и, соответственно, функция начала поездки не отработает.
//
//    5. Подчините класс Танцора протоколу PayableBusinessTrip:
//    - salaryInBusinessTrip вычисляется по такой же логике, как и у музыканта, только потом увеличивается ещё на на 10%
//    - startTrip() - танцор не отправляется в командировку, если его зарплата за день в командировке меньше 100
//    - paySalary() - выводит в консоль сумму, которую музыкант заработал за время командировки.
//    - танцорам доступны для командировки Украина, Грузия, Швеция, Швейцария и Финляндия.
//
//    ===============================================
//                       Solution
//    ===============================================

enum Country: CaseIterable {
    case belarus, russia, ukraine, poland, turkey, germany, america, greace
}

protocol ProtocolForArtist {
    var name: String { get }
}

protocol BusinessTrip {
    var freeCountry: Country { get set }
    var destinationCountry: Country { get }
    var durationOfTrip: Int { get }
    var isCurrentlyInBusinessTrip: Bool { get set }
    
    func startTrip()
    func endTrip()
}

protocol PayableBusinessTrip: BusinessTrip {
    var salaryInBusinessTrip: Int { get }
    var salaryCoefficient: Int { get }
    
    func paySalary()
}

class Artist: ProtocolForArtist {
    var name: String
    var countryJob: Country
    var weekSalary: Int = 300
    
    var procentOfWorkExperienceOfArtist: Int { 100 * workExperience / age }
    
    class var averageSalary: Int {
        return 1200
    }
    
    var daySalary:Int { self.weekSalary / 5 }
    private var _daySalary: Int = 70
    
    var age: Int {
        get {
            return self._age
        }
        set {
            if newValue >= 0 {
                self._age = newValue
            }
        }
    }
    private var _age: Int = 45
    
    var workExperience: Int {
        get {
            return self._workExperience
        }
        set {
            if newValue >= 0 {
                self._workExperience = newValue
            }
        }
    }
    private var _workExperience: Int = 4

    
    init(name: String, workExperience: Int, weekSalary: Int) {
        self.name = ""
        self.workExperience = workExperience
        self.weekSalary = weekSalary
    }
    
    init(name: String, weekSalary: Int, countryJob: Country, workExperience: Int) {
        self.name = ""
        self.weekSalary = weekSalary
        self.countryJob = countryJob
        self.workExperience = workExperience
    }
    
    class func allCountries() -> [Country] {
        var fromEnunOfCoytries: [Country] {
            return [.belarus, .russia, .ukraine, .poland, .turkey, .germany, .america, .greace]
        }
        var arrayOfAllCountries: [Country] = []
        for _ in fromEnunOfCoytries {
            arrayOfAllCountries.append(contentsOf: fromEnunOfCoytries)
        }
        return arrayOfAllCountries
    }
    
    class func printInfo() {
        print("Название класса Artist")
    }
    
    private func infoAboutArtist() {
        print("""
        The name is \(self.name) and \(self.age)
        His experience is \(self.workExperience)
        From country \(self.countryJob)
        His salary is \(self.daySalary)
        """)
    }
    
    func perfomOnStage() {
        print("""
        The name is \(self.name) and \(self.age)
        His experience is \(self.workExperience)
        From country \(self.countryJob)
        His salary is \(self.daySalary)
        выступает в жанре поп и исполняет знаменитую песню
        """)
    }
}

class Musician: Artist {
    var favoriteInstrument: String
    
    init(name: String, weekSalary: Int, countryJob: Country, workExperience: Int, favoriteInstrument: String) {
        self.favoriteInstrument = favoriteInstrument
        super.init(name: name, weekSalary: weekSalary, countryJob: countryJob, workExperience: workExperience)
    }
    
    override class func printInfo() {
        print("Название класса - Musician")
    }
}


class Paintist: Artist, BusinessTrip {
    var freeCountry: Country
    var destinationCountry: Country
    var durationOfTrip: Int
    var isCurrentlyInBusinessTrip: Bool
    
    override var name: String {
        String(super.name.shuffled())
    }
    
    func freeCountryForPaintist() -> (Country, Country, Country, Country, Country) {
        return (.greace, .poland, .belarus, .germany, .america)
    }
    
    func startTrip() {
    }
    
    func endTrip() {
        print("""
            страна назначения \(self.destinationCountry)
            продолжительность \(self.durationOfTrip)
            """)
    }
    
    override class func printInfo() {
        print("Название класса - Paintist.")
    }
    
    init(destinationCountry: Country, durationOfTrip: Int) {
        self.destinationCountry = destinationCountry
        self.durationOfTrip = durationOfTrip
    }
    init() {
        self.destinationCountry = Country.allCases.randomElement()!
        self.durationOfTrip = Int.random(in: 0...100000)
    }
    
    override init(name: String, weekSalary: Int, countryJob: Country, workExperience: Int){
        super.init(name: name, weekSalary: weekSalary, countryJob: countryJob, workExperience: workExperience)
    }
}

class Dancer: Artist {
    override var daySalary: Int {
        if super.daySalary < 100 {
            print("Танцор отказывается выступать")
        }
        return super.daySalary
    }
    override class func printInfo() {
        print("Название класса - Dancer.")
    }
}


let firstArgumentArtist = Artist.init(name: "Petr", weekSalary: 450, countryJob: .belarus, workExperience: 14)
let secondArgumentArtist = Artist.init(name: "Vasya", weekSalary: 650, countryJob: .poland, workExperience: 30)
let firstArgumentMusician = Musician.init(name: "Alesya", weekSalary: 800, countryJob: .poland, workExperience: 35, favoriteInstrument: "guitar")
let secondArgumentMusician = Musician.init(name: "Alex", weekSalary: 90, countryJob: .turkey, workExperience: 17, favoriteInstrument: "piano")
let firstArgumentPaintist = Paintist.init(name: "Sam", weekSalary: 400, countryJob: .belarus, workExperience: 10)
let secondArgumentPaintist = Paintist.init(name: "Tanya", weekSalary: 100, countryJob: .russia, workExperience: 23)
let firstArgumentDancer = Dancer.init(name: "Valya", weekSalary: 340, countryJob: .ukraine, workExperience: 5)
let secondArgumentDancer = Dancer.init(name: "Vlad", weekSalary: 123, countryJob: .ukraine, workExperience: 14)
let sumOfArray: [Artist] = [firstArgumentArtist, secondArgumentArtist, firstArgumentMusician, secondArgumentMusician, firstArgumentPaintist, secondArgumentPaintist, firstArgumentDancer, secondArgumentDancer]

func buildArrayArtistType(artist: [Artist]) -> [Artist] {
    for artist in sumOfArray {
        if artist is Dancer {
            print("\(artist.weekSalary)")
        } else if let artist = artist as? Musician {
            print("\(artist.favoriteInstrument)")
        } else {
            artist.perfomOnStage()
        }
    }
    return sumOfArray
}

buildArrayArtistType(artist: sumOfArray)


//    ===============================================
//                     Task 4
//    ===============================================
//
//    1. Создайте функцию, которая принимает 2 объекта и сравнивает их с помощью замыкания:
//    - 1 аргумент - типа Артист
//    - 2 аргумент - типа Артист
//    - 3 аргумент - замыкание, которое принимает Артистов (1 и 2 аргумент из функции) и возвращает Bool - равны они или нет
//    - Результат сравнения выведите в консоль
//    2. Создайте функцию, которая принимает 2 артистов и возвращает Bool. Если у артистов одинаковый стаж работы и зарплата в неделю, то они равны.
//    Вызовите функцию из 1 пункта, передав ей в качестве 3 аргумента только что созданную функцию.
//    3. Создайте замыкание, которое принмиает 2 артистов и возвращает Bool. Если один артист музыкант, а второй художник и у них одинаковый стаж работы, то они равны.
//    Вызовите функцию из 1 пункта, передав ей в качестве 3 аргумента только что созданное замыкание.
//    4. Вызовите функцию из 1 пункта, реализовав замыкание сразу же. Если у Артистов одинаковое имя, то они равны.
//    Не сокращайте имена аргументов в замыкании.
//    5. Вызовите функцию из 1 пункта, реализовав замыкание сразу же. Если это Художник и Танцор, то они равны.
//    Воспользуйтесь $0 и $1 при обращении к аргументам замыканиия.
//    6. Вызовите функцию из 1 пункта, реализовав замыкание сразу же. Если это Художник и Музыкант, то они будут равны при равенстве имени, возраста и стажа работы.
//    Максимально сократите тело замыкания, а также сделайте его в виде trailing closure.


func comparisonOfArtists(firstArgument: [Artist], _ secondArgument: [Artist]) -> Bool {
    func compare<T: Equatable>(firstArgument: Artist, _ secondArgument: Artist, t: T.Type) -> Bool {
        return firstArgument as? T == secondArgument as? T
    }
    guard firstArgument.count ==  secondArgument.coun else { return false }
    return firstArgument.indices.reduce(true) {
        guard let _firstArgument = firstArgument[$1], let _secondArgument = secondArgument[$1] else { return $0 && _firstArgument[$1] == nil && secondArgument[$1] == nil }
        
        switch $1 {
        case 0:
            return $0 && compare(_firstArgument, _secondArgument, t: String.self)
        case 1:
            return $0 && compare(_firstArgument, _secondArgument, t: String.self)
        default:
            return false
        }
    }
}

func jobExpiriense(firstArgument: [Artist], _secondArgument: [Artist]) -> Bool{
    guard firstArgument.workExperience == _secondArgument.workExperience ||  firstArgument.weekSalary == _secondArgument.weekSalary else { return false }
}

compare<T(firstArgument: sumOfArray.firstArgumentArtist, _ secondArgument: sumOfArray.secondArgumentMusician, t: jobExpiriense(firstArgument: sumOfArray.secondArgumentDancer, _secondArgument: sumOfArray.firstArgumentPaintist))

