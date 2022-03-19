//
//  INeedCoffee.swift
//  lesson_7
//
//  Created by 5vi5t on 19.03.2022.
//

import Foundation

enum CoffeeError: Error {
    case grannyAttack
    case bacteriaAttack
}

class INeedCoffee {
    
    private let coffee = "coffee"
    private let milk = "milk"
    private let sugar = "sugar"
    
    
    func makeCoffeeWithMilk(coffee: String, milk: String) throws -> String {
        if coffee == self.coffee, milk == self.milk {
            return "coffeeWithMilk"
        } else {
            throw CoffeeError.bacteriaAttack
        }
    }
    
    func addSugar(sugar: String, drink: String) throws -> String {
        guard sugar == self.sugar else {
            throw CoffeeError.grannyAttack
        }
        return drink + "+" + sugar
    }
}

