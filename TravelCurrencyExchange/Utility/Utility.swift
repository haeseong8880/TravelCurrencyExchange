//
//  Utility.swift
//  TravelCurrencyExchange
//
//  Created by haeseongJung on 2022/05/09.
//

import Foundation

class Utility {
    static let shared: Utility = Utility()
    
    func numberFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: number))!
    }
}
