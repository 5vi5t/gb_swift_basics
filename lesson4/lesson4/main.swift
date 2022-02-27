//
//  main.swift
//  lesson4
//
//  Created by 5vi5t on 27.02.2022.
//

import Foundation

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

class Locomotive {
    let series: String
    var wagons: Int
    var speed: Int
    var acceleration: Int
    var cost: Int
    var reliability: Int
    var condition: Int
    var age: Int
    
    func locomotiveDescription() {
        print("Локомотив \(series), \nколичество вагонов - \(wagons), \nмаксимальная скорость - \(speed), \nускорение - \(acceleration), \nстоимость - \(cost), \nремонтопригодность - \(reliability), \nсостояние - \(condition), \nвозраст - \(age).")
    }

    init(series: String, wagons: Int, speed: Int, acceleration: Int, cost: Int, reliability: Int, condition: Int, age: Int) {
        self.series = series
        self.wagons = wagons
        self.speed = speed
        self.acceleration = acceleration
        self.cost = cost
        self.reliability = reliability
        self.condition = condition
        self.age = age
    }
}

class FreightLocomotive: Locomotive {
    var route: [RoutePoints]
    var cargoType: CargoType
    var routeDescription: String {
        get {
            var result = ""
            for point in self.route {
                result = result + point.rawValue + " "
            }
            return result
        }
    }
    
    override func locomotiveDescription() {
        print("Локомотив \(series), \nколичество вагонов - \(wagons), \nмаксимальная скорость - \(speed), \nускорение - \(acceleration), \nстоимость - \(cost), \nремонтопригодность - \(reliability), \nсостояние - \(condition), \nвозраст - \(age), \nмаршрут - \(routeDescription), \nтип груза - \(cargoType.rawValue).")
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
        super.init(series: series, wagons: wagons, speed: speed, acceleration: acceleration, cost: cost, reliability: reliability, condition: condition, age: age)
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
    var schedule: [Stations]
    var wagonType: WagonType
    var scheduleDescription: String {
        get {
            var result = ""
            for city in self.schedule {
                result = result + city.rawValue + " "
            }
            return result
        }
    }

    func switchWagonType() {
        if self.schedule.contains(.astana) {
            self.wagonType = .sleeping
        } else {
            self.wagonType = .sitting
        }
    }
    
    override func locomotiveDescription() {
        print("Локомотив \(series), \nколичество вагонов - \(wagons), \nмаксимальная скорость - \(speed), \nускорение - \(acceleration), \nстоимость - \(cost), \nремонтопригодность - \(reliability), \nсостояние - \(condition), \nвозраст - \(age), \nрасписание - \(scheduleDescription), \nтип вагонов - \(wagonType.rawValue).")
    }

    init(series: String, wagons: Int, speed: Int, acceleration: Int, cost: Int, schedule: [Stations], wagonType: WagonType, reliability: Int, condition: Int, age: Int) {
        self.schedule = schedule
        self.wagonType = wagonType
        super.init(series: series, wagons: wagons, speed: speed, acceleration: acceleration, cost: cost, reliability: reliability, condition: condition, age: age)
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

var hawk = FreightLocomotive(series: "62 Deutsche Reichsbahn", wagons: 3, speed: 140, acceleration: 1, cost: 120000, route: [.farm, .mill], cargoType: .bread, reliability: 50, condition: 100, age: 0)
var raven = FreightLocomotive(series: "Wurttemberg T3", wagons: 3, speed: 60, acceleration: 5, cost: 35000, route: [.forest, .sawmill], cargoType: .firewood, reliability: 40, condition: 100, age: 0)
var greyhound = PassangerLocomotive(series: "NUC Hudson", wagons: 1, speed: 160, acceleration: 15, cost: 200000, schedule: [.minsk, .kiev], wagonType: .sitting, reliability: 40, condition: 100, age: 0)
var whale = PassangerLocomotive(series: "Stirling 4-2-2", wagons: 1, speed: 80, acceleration: 1, cost: 100000, schedule: [.moscow, .astana], wagonType: .sitting, reliability: 70, condition: 100, age: 0)

hawk.locomotiveDescription()

hawk.changeCargo()

hawk.locomotiveDescription()

whale.locomotiveDescription()

whale.switchWagonType()

whale.locomotiveDescription()
