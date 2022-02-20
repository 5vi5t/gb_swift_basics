//
//  main.swift
//  lesson-2
//
//  Created by 5vi5t on 19.02.2022.
//

import Foundation

//1. Написать функцию, которая определяет, четное число или нет.
//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
//3. Создать возрастающий массив из 100 чисел.
//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
//
//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.

//1. Написать функцию, которая определяет, четное число или нет.
func isEven(number: Int) -> Bool {
    return (number % 2) == 0
}

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func isDivisibleByThree(number: Int) -> Bool {
    return (number % 3) == 0
}

//3. Создать возрастающий массив из 100 чисел.
func makeArrayGreatAgain() -> [Int] {
    var numberArray: [Int] = []
    for number in 1...100 {
        numberArray.append(number)
    }
    return numberArray
}

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

func arrayClear(array: [Int]) -> [Int] {
    var changedArray: [Int] = []
    for number in array {
        if !isEven(number: number) && isDivisibleByThree(number: number) {
            changedArray.append(number)
        }
    }
    return changedArray
}

//тут уже сложное пошло
//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
//Чи́сла Фибона́ччи (вариант написания — Фибона́чи[2]) — элементы числовой последовательности
//
//0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, … (последовательность A000045 в OEIS),
//в которой первые два числа равны 0 и 1, а каждое последующее число равно сумме двух предыдущих чисел

func appendNewFibonachiNumber(fibonachiArray: inout [Decimal]) {
    var firstPreviousNumber: Decimal = 0
    var secondPreviousNumber: Decimal = 1
    if fibonachiArray.count >= 2 && fibonachiArray[0] == 0 && fibonachiArray[1] == 1 {
        firstPreviousNumber = fibonachiArray[fibonachiArray.count - 1]
        secondPreviousNumber = fibonachiArray[fibonachiArray.count - 2]
    } else {
        fibonachiArray.removeAll()
        fibonachiArray.append(firstPreviousNumber)
        fibonachiArray.append(secondPreviousNumber)
    }

    let newFibonachiNumber = firstPreviousNumber + secondPreviousNumber
    firstPreviousNumber = secondPreviousNumber
    secondPreviousNumber = newFibonachiNumber

    fibonachiArray.append(newFibonachiNumber)
}

func makeFibonachiArray() -> [Decimal] {
    var fibonachiArray: [Decimal] = []
    for _ in 1...100 {
        appendNewFibonachiNumber(fibonachiArray: &fibonachiArray)
    }
    return fibonachiArray
}

//вот это я наворотил канеш


//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.

func simpleDimple() -> [Int] {
    
    var primeNumbersArray: [Int] = []
    
    for index in 0...545 {
        primeNumbersArray.append(index)
    }
    
    primeNumbersArray[1] = 0
    
    var counter = 2
    
    while counter <= (primeNumbersArray.count - 1) / 2 {
        if primeNumbersArray[counter] != 0 {
            var multipleNumber = counter * counter
            while multipleNumber <= primeNumbersArray.count - 1 {
                primeNumbersArray[multipleNumber] = 0
                multipleNumber = multipleNumber + counter
            }
        }
        counter += 1
    }
    
    var primeNumbersSet = Set(primeNumbersArray)
    
    primeNumbersSet.remove(0)
    
    primeNumbersArray = Array(primeNumbersSet)
    
    primeNumbersArray = primeNumbersArray.sorted()
    
    return primeNumbersArray
    
    //ну тут чисто с интернета переписал
}

//1. Написать функцию, которая определяет, четное число или нет.
//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
//3. Создать возрастающий массив из 100 чисел.
//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
//
//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.

//ну без этого никуда
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
func inputNumber() -> Int {
    var number: Int = 0
    while number == 0 {
        if let input = readLine() {
            if Int(input) != nil {
                number = Int(input)!
                return number
            } else {
                numberError()
                continue
            }
        }
    }
}

func taskList() {
    beautiful()
    print("Задания: ")
    beautiful()
    print("1. Написать функцию, которая определяет, четное число или нет.")
    beautiful()
    print("2. Написать функцию, которая определяет, делится ли число без остатка на 3.")
    beautiful()
    print("3. Создать возрастающий массив из 100 чисел.")
    beautiful()
    print("4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.")
    beautiful()
    print("5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.")
    beautiful()
    print("6. * Заполнить массив из 100 элементов различными простыми числами.")
    beautiful()
    print("7. Выход")
}

taskList()

var isWork = true

repeat {
    beautiful()
    print("Выбери номер задания:")
    switch inputNumber() {
    case 1:
        print("Введи число, и давай проверим, четное или нет.")
        if isEven(number: inputNumber()) {
            print("Четное")
        } else {
            print("Нечётное")
        }
    case 2:
        print("Введи число, и давай проверим, делится на три без остатка или нет.")
        if isDivisibleByThree(number: inputNumber()) {
            print("Делится")
        } else {
            print("Не делится")
        }
    case 3:
        let array = makeArrayGreatAgain()
        print("Я сделалЪ, вот смотри:")
        print(array)
    case 4:
        let array = makeArrayGreatAgain()
        let clearArray = arrayClear(array: array)
        print("Я сделалЪ, вот смотри:")
        print(clearArray)
    case 5:
        let array = makeFibonachiArray()
        print("Я сделалЪ, вот смотри:")
        print(array)
    case 6:
        let array = simpleDimple()
        print("Я сделалЪ, вот смотри:")
        print(array)
    case 7:
        print("7. Выход.")
        isWork = !isWork
    default:
        numberError()
    }
} while isWork
