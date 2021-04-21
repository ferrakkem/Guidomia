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
