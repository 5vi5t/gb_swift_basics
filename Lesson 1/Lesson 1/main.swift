//
//  main.swift
//  Lesson 1
//
//  Created by 5vi5t on 16.02.2022.
//

import Foundation


//тут будем красиво делать, а сделал какую-то херню, но мне нравится
func beautiful() {
    let symbolArray: [Character] = [ "~", "!", "@", "#", "$", "%", "&", "-", "+", "=" ];
    let nonBeautiful = "********"
    var beautiful = ""
    let randomNumber = arc4random_uniform(UInt32(symbolArray.count))
    var counter = 0
    while counter < 8 {
        beautiful.append(symbolArray[Int(randomNumber)])
        counter += 1
    }
    let resultString = nonBeautiful + beautiful + nonBeautiful + beautiful + nonBeautiful + beautiful + nonBeautiful + beautiful + nonBeautiful
    print(resultString)
}

func numberError() {
        print("все херня давай по новой, забыл как цифры писать?")
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
                numberError()
                continue
            }
        }
    }
    return 0
}

//надо запилить решение квадратного уравнения
func quadraticEquation() {
    print("В уравнении вида ax2 + bx + c = 0 введи a")
    let firstCoefA: Double = inputNumber()
    beautiful()
    print("В уравнении вида ax2 + bx + c = 0 введи b")
    let secondCoefB: Double = inputNumber()
    beautiful()
    print("В уравнении вида ax2 + bx + c = 0 введи c")
    let freeMemberC: Double = inputNumber()
    beautiful()
    var firstQuadraticRoot: Double
    var secondQuadraticRoot: Double
    var quadraticRoot: Double
    //b2 - 4ac ищем дискриминант, ля кто его дискридитировал? ахах
    let discriminant: Double = (secondCoefB * secondCoefB) - 4 * firstCoefA * freeMemberC
    //d>0 x = -b +- sqrt(d)/2a; d=0 х = −b/2a; d<0 нифига
    if (discriminant > 0) {
        firstQuadraticRoot = (-1 * secondCoefB + discriminant.squareRoot()) / (2 * firstCoefA)
        secondQuadraticRoot = (-1 * secondCoefB - discriminant.squareRoot()) / (2 * firstCoefA)
        print("Тут два квадратных корня - Лёлик и Болик или \(firstQuadraticRoot) и \(secondQuadraticRoot)")
        beautiful()
    } else if (discriminant == 0) {
        quadraticRoot = (-1 * secondCoefB) / (2 * firstCoefA)
        print("Тут получается 1 квадратный корень, и это АВТОМОБИЛЬ! в смысле \(quadraticRoot)")
        beautiful()
    } else {
        print("У данного квадратного уравнения корней нет, и шуток у меня тоже больше нет")
        beautiful()
    }
}

//теперь пилим прямоугольный треугольник у которого мы знаем катеты. ищем площадь улицу фонарь, периметр горят фонари одинокая гитара поет, гипотенузу длиннее катета

func rightTriangle () {
    //вводим катеты они же ляжки лол
    print("есть два стула, в смысле два катета, введи длину стороны А, в метрах")
    let legA: Double = inputNumber()
    beautiful()
    print("теперь сторону В")
    let legB: Double = inputNumber()
    beautiful()
    //ищем гипотенузу ну тут я даже без гугла справлюсь
    let hypotenuseC = (legA * legA + legB * legB).squareRoot()
    
    //площадь
    let areaABC = 0.5 * legA * legB
    
    //периметр
    let perimeterABC = legA + legB + hypotenuseC
    
    //ну это изи ваще. печатаем
    print("площадь равна получается \(areaABC) кв.м, периметр \(perimeterABC) м, гипотенуза \(hypotenuseC) м")
    beautiful()
}

func richTask() {
    //ищем сумму вклада, задачка для богатых, получается
    //вводим первоначальный вклад в рублях
    print("вводим первоначальный вклад в рублях")
    let startBankDeposit = inputNumber()
    beautiful()
    //вводим годовой процент опять что-то на богатом
    print("вводим годовой процент")
    let annualInterestRate = inputNumber()
    beautiful()
    //ищем процент в месяц
    let monthlyInterestRate = annualInterestRate / 12
    //количество месяцев 12*5=60
    //ищем финальный вклад
    var month = 0
    var finalBankDeposit = startBankDeposit
    print(finalBankDeposit)
    while month <= 60 {
        finalBankDeposit = finalBankDeposit + finalBankDeposit * monthlyInterestRate / 100
        month += 1
    }
    print("Ты разбогател! Положил \(startBankDeposit), а теперь у тебя - \(finalBankDeposit)")
    beautiful()
}

beautiful()
print("Программа решает задачи.")
beautiful()
print("1. Квадратное уравнение")
beautiful()
print("2. Всякие штуки в прямоугольном треугольнике по катетам")
beautiful()
print("3. Задачка для богатых")
beautiful()
print("Вводи номер задачки")

//ту ду - запилим выбор задач, ну и затестим свичкейс
switch inputNumber() {
case 1:
    print("1. Решаем, значит, квадратное уравнение.")
    quadraticEquation()
case 2:
    print("2. Давай катеты прямоугольного треугольника. Найдём площадь, периметр и гипотенузу треугольника.")
    rightTriangle()
case 3:
    print("3. Вводи сумму вклада в банк и годовой процент. Найдём сумму вклада через 5 лет.")
    richTask()
default:
    numberError()
}
beautiful()

//туду еще бы в цикл это запилить и кнопку выход присобачить, но я чет накосячил с гитигнором, пойду гуглить
