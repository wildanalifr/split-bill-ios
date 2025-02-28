//
//  Split.swift
//  split-bill
//
//  Created by Wildan on 25/02/25.
//

import Foundation

enum Method: String {
    case cash = "cash"
    case card = "card"
    case wallet = "wallet"
}

struct Split {
    var amount: Double
    var tip: Float
    var person: Int
    var method: Method
    
    mutating func changeMethod(_ method: Method) {
        self.method = method
    }
    
    mutating func changeTip(_ tip: Float) {
        self.tip = tip
    }
    
    mutating func changeAmount(_ amount: Double) {
        self.amount = amount
    }
    
    mutating func changePerson(_ person: Int) {
        self.person = person
    }
    
    mutating func getResult() -> Double {
//        print("amount: \(amount)")
//        print("tip: \(tip)")
        let tipResult = (amount * Double(tip))
        let totalAmount = amount + tipResult
        let perPerson = totalAmount / Double(person) // Bagikan ke setiap orang

        print("amount: \(amount)")
        print("person: \(person)")
        print("double person \(Double(person))")
        print("Tip Result: \(tipResult)")
        print("Total Amount (with tip): \(totalAmount)")
        print("hitung: \(0.0 / 0.0)")
        print("Per Person: \(perPerson)")

        return perPerson
    }
    
    mutating func getAmount() -> Double {
        return self.amount
    }
    
    mutating func getTip() -> Float {
        return self.tip
    }
    
    mutating func getPerson() -> Int {
        return self.person
    }
    
    mutating func getMethod() -> Method {
        return self.method
    }
}
