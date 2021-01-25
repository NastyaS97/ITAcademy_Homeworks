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
//                       Solution
//    ===============================================


class Artist {
    enum Country: CaseIterable{
        case belarus, russia, ukraine, poland, turkey
    }
    
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
    var countryJob: Country
    var weekSalary: Int = 300
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
    var daySalary:Int {
        get {
            return self.weekSalary / 5
        }
        set {
            if newValue < 100 {
                self._age = newValue
                print("Я отказываюсь выступать")
            }
        }
    }
    var procentOfWorkExperienceOfArtist: Int { 100 * self.workExperience / self.age }
    
    class var averageSalary: Int {
        return 1200
    }
    private var _age: Int = 23
    private(set) var name: String = ""
    private var _workExperience: Int = 4
    private var _daySalary: Int = 70
    
    
    init(name: String, countryJob: Country, workExperience: Int) {
        self.name = name
        self.countryJob = countryJob
        self.workExperience = workExperience
    }
    
    init(name: String, weekSalary: Int, countryJob: Country) {
        self.name = name
        self.weekSalary = weekSalary
        self.countryJob = countryJob
    }
    
    static func allCountries() -> [Country] {
        var fromEnunOfCoytries = Artist.Country.AllCases
            .map({ "\($0)" })
            .joined(separator: ", ")
        var arrayOfAllCountries: [Country] = []
        for _ in fromEnunOfCoytries {
            arrayOfAllCountries.append(fromEnunOfCoytries)
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
    
    class Musician: Artist {
        var favoriteInstrument: String
        
        init(name: String, countryJob: Country, workExperience: Int, favoriteInstrument: String) {
            self.favoriteInstrument = favoriteInstrument
            super.init(name: name, countryJob: countryJob, workExperience: workExperience)
        }
        
        override class func printInfo() {
            print("Название класса - Musician")
            
        }
    }
    
    class Paintist: Artist {
        override class func printInfo() {
            print("Название класса - Paintist.")
        }
    }
    
    class Dancer: Artist {
        override class func printInfo() {
            print("Название класса - Dancer.")
        }
    }
}


let firstArgumentArtist = Artist.init(name: "Petr", countryJob: .belarus, workExperience: 14)
let secondArgumentArtist = Artist.init(name: "Vasya", weekSalary: 650, countryJob: .poland)
let firstArgumentMusician = Artist.Musician.init(name: "Alesya", countryJob: .poland, workExperience: 16, favoriteInstrument: "guitar")
let secondArgumentMusician = Artist.Musician.init(name: "Alex", countryJob: .turkey, workExperience: 17, favoriteInstrument: "piano")
let firstArgumentPaintist = Artist.Paintist.init(name: "Sam", weekSalary: 400, countryJob: .belarus)
let secondArgumentPaintist = Artist.Paintist.init(name: "Tanya", weekSalary: 100, countryJob: .russia)
let firstArgumentDancer = Artist.Dancer.init(name: "Valya", weekSalary: 340, countryJob: .ukraine)
let secondArgumentDancer = Artist.Dancer.init(name: "Vlad", countryJob: .ukraine, workExperience: 14)
let sumOfArray: [Artist] = [firstArgumentArtist, secondArgumentArtist, firstArgumentMusician, secondArgumentMusician, firstArgumentPaintist, secondArgumentPaintist, firstArgumentDancer, secondArgumentDancer]

func buildArrayArtistType(artist: [Artist]) -> [Artist] {
    for artist in sumOfArray {
        if artist is Dancer {
            print("\(artist.weekSalary)")
        } else if artist is Musician {
            print("\(artist.favoriteInstrument)")
        } else {
            artist.perfomOnStage
        }
    }
    return sumOfArray
}

buildArrayArtistType(artist: sumOfArray)
