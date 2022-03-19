//
//  main.swift
//  lesson_7
//
//  Created by 5vi5t on 19.03.2022.
//

import Foundation

let iNeedCoffee = INeedCoffee()

do {
    let myFavoriteCoffee = try iNeedCoffee.makeCoffeeWithMilk(coffee: "coffee", milk: "milk")
    let coffeeWithMilkAndSugar = try iNeedCoffee.addSugar(sugar: "sugar", drink: myFavoriteCoffee)
    print("наконец-то выпью \(coffeeWithMilkAndSugar)")
} catch CoffeeError.bacteriaAttack {
    print("молоко скисло")
} catch CoffeeError.grannyAttack {
    print("бабки скупили весь сахар")
}


















