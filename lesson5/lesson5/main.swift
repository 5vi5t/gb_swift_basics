//
//  main.swift
//  lesson5
//
//  Created by 5vi5t on 02.03.2022.
//

import Foundation

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

//конструкция прям топовая, мне оч понравилась, респект!
//var pr: String?
//var name: String
//
//var FullName: String {
//    return (pr != nil ? pr! + " " : "") + name

protocol Locomotive {
    var series: String { get }
    var wagons: Int { get set }
    var speed: Int { get set }
    var acceleration: Int { get set }
    var cost: Int { get set }
    var reliability: Int { get set }
    var condition: Int { get set }
    var age: Int { get set }
    
    func letsGo()
    func stopItNow()
}

extension Locomotive {
    func letsGo() {
        print("погнали реще")
    }
    func stopItNow() {
        print("тормози на!")
    }
}

class FreightLocomotive: Locomotive {
    var series: String
    var wagons: Int
    var speed: Int
    var acceleration: Int
    var cost: Int
    var reliability: Int
    var condition: Int
    var age: Int
    
    var route: [RoutePoints]
    var cargoType: CargoType
    var routeDescription: String {
        get {
//            как было
//            var result = ""
//            for point in self.route {
//                result = result + point.rawValue + " "
//            }
//            return result
//            как миша научил
            var result: String?
            for point in self.route {
                result = (result != nil ? result! + " - " : "") + point.rawValue
            }
            return result ?? ""
        }
    }
    
    func changeCargo() {
        for route in self.route {
            switch route {
            case .forest:
                self.cargoType = .firewood
            case .sawmill:
                self.cargoType = .planks
            case .mine:
                self.cargoType = .ore
            case .factory:
                self.cargoType = .iron
            case .farm:
                self.cargoType = .wheat
            case .mill:
                self.cargoType = .flour
            case .bakery:
                self.cargoType = .bread
            }
        }
    }
    
    init(series: String, wagons: Int, speed: Int, acceleration: Int, cost: Int, route: [RoutePoints], cargoType: CargoType, reliability: Int, condition: Int, age: Int) {
        self.route = route
        self.cargoType = cargoType
        self.series = series
        self.wagons = wagons
        self.speed = speed
        self.acceleration = acceleration
        self.cost = cost
        self.reliability = reliability
        self.condition = condition
        self.age = age
    }
    
    enum RoutePoints: String {
        case forest = "лес"
        case sawmill = "лесопилка"
        case mine = "шахта"
        case factory = "завод"
        case farm = "ферма"
        case mill = "мельница"
        case bakery = "пекарня"
    }
    
    enum CargoType: String {
        case firewood = "дрова"
        case planks = "доски"
        case ore = "руда"
        case iron = "железо"
        case wheat = "зерно"
        case flour = "мука"
        case bread = "хлеб"
    }
}

class PassangerLocomotive: Locomotive {
    var series: String
    var wagons: Int
    var speed: Int
    var acceleration: Int
    var cost: Int
    var reliability: Int
    var condition: Int
    var age: Int
    
    var schedule: [Stations]
    var wagonType: WagonType
    var scheduleDescription: String {
        get {
            var result: String?
            for city in self.schedule {
                result = (result != nil ? result! + " - " : "") + city.rawValue
            }
            return result ?? ""
        }
    }

    func switchWagonType() {
        if self.schedule.contains(.astana) {
            self.wagonType = .sleeping
        } else {
            self.wagonType = .sitting
        }
    }

    init(series: String, wagons: Int, speed: Int, acceleration: Int, cost: Int, schedule: [Stations], wagonType: WagonType, reliability: Int, condition: Int, age: Int) {
        self.schedule = schedule
        self.wagonType = wagonType
        self.series = series
        self.wagons = wagons
        self.speed = speed
        self.acceleration = acceleration
        self.cost = cost
        self.reliability = reliability
        self.condition = condition
        self.age = age
    }

    enum Stations: String {
        case moscow = "Москва"
        case kiev = "Киев"
        case minsk = "Минск"
        case astana = "Астана"
    }

    enum WagonType: String {
        case sitting = "сидячий"
        case sleeping = "спальный"
    }
}

extension FreightLocomotive: CustomStringConvertible {
    var description: String {
        return "Локомотив \(series), \nколичество вагонов - \(wagons), \nмаксимальная скорость - \(speed), \nускорение - \(acceleration), \nстоимость - \(cost), \nремонтопригодность - \(reliability), \nсостояние - \(condition), \nвозраст - \(age), \nмаршрут - \(routeDescription), \nтип груза - \(cargoType.rawValue)."
    }
}

extension PassangerLocomotive: CustomStringConvertible {
    var description: String {
        return "Локомотив \(series), \nколичество вагонов - \(wagons), \nмаксимальная скорость - \(speed), \nускорение - \(acceleration), \nстоимость - \(cost), \nремонтопригодность - \(reliability), \nсостояние - \(condition), \nвозраст - \(age), \nрасписание - \(scheduleDescription), \nтип вагонов - \(wagonType.rawValue)."
    }
}

var hawk = FreightLocomotive(series: "62 Deutsche Reichsbahn", wagons: 3, speed: 140, acceleration: 1, cost: 120000, route: [.farm, .mill], cargoType: .bread, reliability: 50, condition: 100, age: 0)
var raven = FreightLocomotive(series: "Wurttemberg T3", wagons: 3, speed: 60, acceleration: 5, cost: 35000, route: [.forest, .sawmill], cargoType: .firewood, reliability: 40, condition: 100, age: 0)
var greyhound = PassangerLocomotive(series: "NUC Hudson", wagons: 1, speed: 160, acceleration: 15, cost: 200000, schedule: [.minsk, .kiev], wagonType: .sitting, reliability: 40, condition: 100, age: 0)
var whale = PassangerLocomotive(series: "Stirling 4-2-2", wagons: 1, speed: 80, acceleration: 1, cost: 100000, schedule: [.moscow, .astana], wagonType: .sitting, reliability: 70, condition: 100, age: 0)

print(hawk)

hawk.changeCargo()

print(hawk)

print(whale)

whale.switchWagonType()

print(whale)

