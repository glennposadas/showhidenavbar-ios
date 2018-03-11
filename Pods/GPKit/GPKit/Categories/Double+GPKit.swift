//
//  Double+GPKit.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/10/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import UIKit

public extension Double {
    /// Rounds the double to decimal places value
    public func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
