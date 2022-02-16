//
//  main.swift
//  Lesson 1
//
//  Created by 5vi5t on 16.02.2022.
//

import Foundation


//тут будем красиво делать
func beatiful() {
    print("********88888888888888888********")
}

//вводим цифру прям точно цифру
func inputNumber() -> Double {
    var number: Double = 0
    while number == 0 {
        if let input = readLine() {
            if Double(input) != nil {
                number = Double(input)!
                return number
            } else {
                print("все херня давай по новой, забыл как цифры писать?")
                continue
            }
        }
    }
    return 0
}

//ту ду - запилим выбор задач
print("1. Решить квадратное уравнение.")
print("2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.")
print("3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.")

//var taskNumber = inputNumber()

//надо запилить решение квадратного уравнения

print("В уравнении вида ax2 + bx + c = 0 введи a")
var firstCoefA: Double = inputNumber()

print("В уравнении вида ax2 + bx + c = 0 введи b")
var secondCoefB: Double = inputNumber()

print("В уравнении вида ax2 + bx + c = 0 введи c")
var freeMemberC: Double = inputNumber()

var firstQuadraticRoot: Double
var secondQuadraticRoot: Double
var quadraticRoot: Double
//b2 - 4ac ищем дискриминант, ля кто его дискридитировал? ахах
var discriminant: Double = (secondCoefB * secondCoefB) - 4 * firstCoefA * freeMemberC
//d>0 x = -b +- sqrt(d)/2a; d=0 х = −b/2a; d<0 нифига
if (discriminant > 0) {
    firstQuadraticRoot = (-1 * secondCoefB + discriminant.squareRoot()) / (2 * firstCoefA)
    secondQuadraticRoot = (-1 * secondCoefB - discriminant.squareRoot()) / (2 * firstCoefA)
    print("Тут два квадратных корня - Лёлик и Болик или \(firstQuadraticRoot) и \(secondQuadraticRoot)")
} else if (discriminant == 0) {
    quadraticRoot = (-1 * secondCoefB) / (2 * firstCoefA)
    print("Тут получается 1 квадратный корень, и это АВТОМОБИЛЬ! в смысле \(quadraticRoot)")
} else {
    print("У данного квадратного уравнения корней нет")
}

//теперь пилим прямоугольный треугольник у которого мы знаем катеты. ищем площадь улицу фонарь, периметр горят фонари одинокая гитара поет, гипотенузу длиннее катета

//вводим катеты они же ляжки лол
print("есть два стула, в смысле два катета, введи длину стороны А, в метрах")
var legA: Double = inputNumber()
print("теперь сторону В")
var legB: Double = inputNumber()

//ищем гипотенузу ну тут я даже без гугла справлюсь
var hypotenuseC = (legA * legA + legB * legB).squareRoot()

//площадь
var areaABC = 0.5 * legA * legB

//периметр
var perimeterABC = legA + legB + hypotenuseC

//ну это изи ваще. печатаем
print("площадь равна получается \(areaABC) кв.м, периметр \(perimeterABC) м, гипотенуза \(hypotenuseC) м")

//ищем сумму вклада, задачка для богатых, получается
//вводим первоначальный вклад в рублях
print("вводим первоначальный вклад в рублях")
var startBankDeposit = inputNumber()
//вводим годовой процент опять что-то на богатом
print("вводим годовой процент")
var annualInterestRate = inputNumber()
//ищем процент в месяц
var monthlyInterestRate = annualInterestRate / 12
//количество месяцев 12*5=60
//ищем финальный вклад
var month = 0
var finalBankDeposit = startBankDeposit
print(finalBankDeposit)
while month <= 60 {
    finalBankDeposit = finalBankDeposit + finalBankDeposit * monthlyInterestRate / 100
    month += 1
}
print(finalBankDeposit)

