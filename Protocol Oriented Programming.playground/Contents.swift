//: Playground - noun: a place where people can play

import Foundation


protocol Ordered {
    func precedes(other: Self) -> Bool
}

struct Number : Ordered {
    var value: Double = 0
    func precedes(other: Number) -> Bool {
        return self.value < (other).value
    }
}


