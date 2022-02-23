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
    
    mutating func changeCargo(route: RoutePoints) {
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
    
    mutating func wagonType(station: Stations) {
        switch station {
        case .astana:
            self.wagonType = .sleeping
        case .moscow:
            self.wagonType = .sitting
        case .kiev:
            self.wagonType = .sitting
        case .minsk:
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
