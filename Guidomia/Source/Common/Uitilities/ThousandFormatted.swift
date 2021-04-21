//
//  ThousandFormatted.swift
//  Guidomia
//
//  Created by Ferrakkem Bhuiyan on 2021-04-21.
//

import Foundation

extension FloatingPoint {
    var kFormatted: String {
        return String(format: self >= 1000 ? "$%.0fK" : "$%.0f", (self >= 1000 ? self/1000 : self) as! CVarArg )
    }
}


extension Double {
    func reduceScale(to places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        let newDecimal = multiplier * self // move the decimal right
        let truncated = Double(Int(newDecimal)) // drop the fraction
        let originalDecimal = truncated / multiplier // move the decimal back
        return originalDecimal
    }
}
