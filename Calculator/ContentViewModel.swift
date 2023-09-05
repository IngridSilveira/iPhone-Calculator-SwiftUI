//
//  ContentViewModel.swift
//  Calculator
//
//  Created by userext on 01/09/23.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var values = "0"
    @Published var previous = 0.0
    @Published var result = 0.0
    @Published var decimal = 0.0
    @Published var operation = 0
    @Published var previousOperation = 0
    
    func formatter(value: Double) -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: value)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 11
        formatter.maximumIntegerDigits = 9
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        return formatter.string(from: number) ?? ""
    }
    
    func process(digit: Int) {
        if operation > 0 {
            result = 0
            previousOperation = operation
            operation = -1
        }
        if decimal > 0.0 {
            result = result + Double(truncating: NSNumber(value: Double(digit) / decimal))
            decimal = decimal * 10
            values = "\(values)\(digit)"
        } else {
            result = (result * 10) + Double(digit)
            values = formatter(value: result)
        }
    }
    
    func reset() {
        previous = 0
        result = 0
        previousOperation = 0
        operation = 0
        decimal = 0
        values = "0"
    }
    
    func calculate() {
        if previousOperation == 1 { //soma
            result = previous + result
            previousOperation = 0
        } else if previousOperation == 2 {
            result = previous - result
            previousOperation = 0
        } else if previousOperation == 3 {
            result = previous * result
            previousOperation = 0
        } else if previousOperation == 4 {
            result = previous / result
            previousOperation = 0
        }
        decimal = 0.0
        previous = result
        values = formatter(value: result)
        
    }
}


