//
//  main.swift
//  lesson3
//
//  Created by 5vi5t on 23.02.2022.
//

import Foundation

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum Stations {
    case moscow
    case kiev
    case minsk
    case astana
}

enum WagonType {
    case sitting
    case sleeping
}

enum RoutePoints {
    case forest
    case sawmill
    case mine
    case factory
    case farm
    case mill
    case bakery
}

enum CargoType {
    case firewood
    case planks
    case ore
    case iron
    case wheat
    case flour
    case bread
}

struct FreightLocomotive {
    var series: String
    var wagons: Int
    var speed: Int
    var acceleration: Int
    var cost: Int
    var route: [RoutePoints]
    var cargoType: CargoType
    var reliability: Int
    var condition: Int
    var age: Int
    
    mutating func changeCargo() {
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
        self.series = series
        self.wagons = wagons
        self.speed = speed
        self.acceleration = acceleration
        self.cost = cost
        self.route = route
        self.cargoType = cargoType
        self.reliability = reliability
        self.condition = condition
        self.age = age
    }
}

struct PassangerLocomotive {
    var series: String
    var wagons: Int
    var speed: Int
    var acceleration: Int
    var cost: Int
    var schedule: [Stations]
    var wagonType: WagonType
    var reliability: Int
    var condition: Int
    var age: Int
    
    mutating func switchWagonType() {
        if self.schedule.contains(.astana) {
            self.wagonType = .sleeping
        } else {
            self.wagonType = .sitting
        }
    }
    
    init(series: String, wagons: Int, speed: Int, acceleration: Int, cost: Int, schedule: [Stations], wagonType: WagonType, reliability: Int, condition: Int, age: Int) {
        self.series = series
        self.wagons = wagons
        self.speed = speed
        self.acceleration = acceleration
        self.cost = cost
        self.schedule = schedule
        self.wagonType = wagonType
        self.reliability = reliability
        self.condition = condition
        self.age = age
    }
}

var hawk = FreightLocomotive(series: "62 Deutsche Reichsbahn", wagons: 3, speed: 140, acceleration: 1, cost: 120000, route: [.farm, .mill], cargoType: .bread, reliability: 50, condition: 100, age: 0)
var raven = FreightLocomotive(series: "Wurttemberg T3", wagons: 3, speed: 60, acceleration: 5, cost: 35000, route: [.forest, .sawmill], cargoType: .firewood, reliability: 40, condition: 100, age: 0)
var greyhound = PassangerLocomotive(series: "NUC Hudson", wagons: 1, speed: 160, acceleration: 15, cost: 200000, schedule: [.minsk, .kiev], wagonType: .sitting, reliability: 40, condition: 100, age: 0)
var whale = PassangerLocomotive(series: "Stirling 4-2-2", wagons: 1, speed: 80, acceleration: 1, cost: 100000, schedule: [.moscow, .astana], wagonType: .sitting, reliability: 70, condition: 100, age: 0)

print(hawk.cargoType)

hawk.changeCargo()

print(hawk.cargoType)

print(whale.wagonType)

whale.switchWagonType()

print(whale.wagonType)
