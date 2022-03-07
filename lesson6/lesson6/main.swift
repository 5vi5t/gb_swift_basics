//
//  main.swift
//  lesson6
//
//  Created by 5vi5t on 06.03.2022.
//

import Foundation

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct Queue<T> {
    private var elements = [T]()
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        if elements.count != 0 {
            return elements.removeFirst()
        } else { return nil }
    }
    
    func filterQueue(_ predicate: (T) -> Bool) -> [T] {
        var tmpArray = [T]()
        for element in elements {
            if predicate(element) {
                tmpArray.append(element)
            }
        }
        return tmpArray
    }
    subscript(index: Int) -> T? {
        get {
            if index < elements.count {
                return elements[index]
            } else { return nil }
        }
        set {
            if index < elements.count {
                elements[index] = newValue!
            }
        }
    }
    
}

var queue1 = Queue<Int>()

queue1.push(10)
queue1.push(20)
queue1.push(30)
print(queue1.pop() ?? "очередь пуста")

print(queue1.filterQueue() { $0 % 3 != 0 })

var test = 100
var ar = [Int](1...10)
var ar1 = [Int](1...3)
var names = ["vasya", "anton", "mars"]
print(ar.filter { $0 % 2 == 0 })
ar.sort { $0 > $1 }
print(ar)
print(ar.map { $0 * 2 })
print(ar1.reduce(0, +))

var queueArray = queue1.filterQueue() { $0 == $0 }
print(queueArray.count)

print(queue1[0],queue1[1],queue1[2])

queue1[1] = 40
queue1[2] = 50

print(queue1)










