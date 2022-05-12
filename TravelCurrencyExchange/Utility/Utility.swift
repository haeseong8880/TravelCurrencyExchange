//
//  Utility.swift
//  TravelCurrencyExchange
//
//  Created by haeseongJung on 2022/05/09.
//

import Foundation
import UIKit

class Utility {
    static let shared: Utility = Utility()
    
    func numberFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: number))!
    }
    
    func getDeviceWidth() -> Double {
        return UIScreen.main.bounds.size.width
    }
    
    func getDeviceHeight() -> Double {
        return UIScreen.main.bounds.size.height
    }
    
    func alert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { action in }
        alert.addAction(okAction)
        return alert
    }
    
    func attibuteChange(label: UILabel, changeString: String) {
        let attributedinputMoney = NSMutableAttributedString(string: label.text!)
        attributedinputMoney.addAttribute(.foregroundColor, value: UIColor.lightGray, range: (label.text! as NSString).range(of: changeString))
        attributedinputMoney.addAttribute(.font, value: UIFont.systemFont(ofSize: 22), range: (label.text! as NSString).range(of: changeString))
        label.attributedText = attributedinputMoney
    }
}
