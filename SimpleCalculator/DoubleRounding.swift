//
//  DoubleRounding.swift
//  SimpleCalculator
//
//  Created by Alireza on 2/11/19.
//  Copyright © 2019 Amir Hossein. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    override func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
