//
//  NumberPad.swift
//  TravelCurrencyExchange
//
//  Created by haeseongJung on 2022/05/03.
//

import Foundation
import UIKit
import SnapKit
import Then

class NumberPadViewController: UIView {
    
    //MARK: - Properties
    private let numberPad7 = UILabel().then {
        $0.text = "7"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    private let numberPad8 = UILabel().then {
        $0.text = "8"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .cyan
        $0.layer.cornerRadius = 5
    }
    
    private let numberPad9 = UILabel().then {
        $0.text = "9"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    private let numberPad4 = UILabel().then {
        $0.text = "4"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    private let numberPad5 = UILabel().then {
        $0.text = "5"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    private let numberPad6 = UILabel().then {
        $0.text = "6"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    private let numberPad1 = UILabel().then {
        $0.text = "1"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    private let numberPad2 = UILabel().then {
        $0.text = "2"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    private let numberPad3 = UILabel().then {
        $0.text = "3"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    private let numberPad0 = UILabel().then {
        $0.text = "0"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    private let numberPadPoint = UILabel().then {
        $0.text = "."
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    private let numberPadClear = UILabel().then {
        $0.text = "C"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    private let padDivision = UILabel().then {
        $0.text = "÷"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    private let padMultiply = UILabel().then {
        $0.text = "×"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    private let padMinus = UILabel().then {
        $0.text = "-"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    private let padPlus = UILabel().then {
        $0.text = "+"
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .brown
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    private func layout() {
        [ numberPad7, numberPad8, numberPad9, numberPad6, numberPad5, numberPad4, numberPad3, numberPad2, numberPad1, numberPad0, numberPadPoint, numberPadClear, padDivision, padMultiply, padMinus, padPlus ].forEach {
            self.addSubview($0)
        }
        
        numberPad7.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(30)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(80)
        }
        
        numberPad8.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(30)
            $0.leading.equalTo(numberPad7.snp.trailing).offset(20)
            $0.width.equalTo(80)
        }
        
        numberPad9.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(30)
            $0.leading.equalTo(numberPad8.snp.trailing).offset(20)
            $0.width.equalTo(80)
        }
        
        padDivision.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(30)
            $0.leading.equalTo(numberPad9.snp.trailing).offset(20)
            $0.width.equalTo(80)
        }
        
        numberPad4.snp.makeConstraints {
            $0.top.equalTo(numberPad7.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(80)
        }
        
        numberPad5.snp.makeConstraints {
            $0.top.equalTo(numberPad7.snp.bottom).offset(10)
            $0.leading.equalTo(numberPad4.snp.trailing).offset(20)
            $0.width.equalTo(80)
        }
        
        numberPad6.snp.makeConstraints {
            $0.top.equalTo(numberPad7.snp.bottom).offset(10)
            $0.leading.equalTo(numberPad5.snp.trailing).offset(20)
            $0.width.equalTo(80)
        }
        
        padMultiply.snp.makeConstraints {
            $0.top.equalTo(numberPad7.snp.bottom).offset(10)
            $0.leading.equalTo(numberPad6.snp.trailing).offset(20)
            $0.width.equalTo(80)
        }
        
        numberPad1.snp.makeConstraints {
            $0.top.equalTo(numberPad4.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(80)
        }
        
        numberPad2.snp.makeConstraints {
            $0.top.equalTo(numberPad4.snp.bottom).offset(10)
            $0.leading.equalTo(numberPad1.snp.trailing).offset(20)
            $0.width.equalTo(80)
        }
        
        numberPad3.snp.makeConstraints {
            $0.top.equalTo(numberPad4.snp.bottom).offset(10)
            $0.leading.equalTo(numberPad2.snp.trailing).offset(20)
            $0.width.equalTo(80)
        }
        
        padMinus.snp.makeConstraints {
            $0.top.equalTo(numberPad4.snp.bottom).offset(10)
            $0.leading.equalTo(numberPad3.snp.trailing).offset(20)
            $0.width.equalTo(80)
        }
        
        numberPad0.snp.makeConstraints {
            $0.top.equalTo(numberPad1.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(80)
        }
        
        numberPadPoint.snp.makeConstraints {
            $0.top.equalTo(numberPad1.snp.bottom).offset(10)
            $0.leading.equalTo(numberPad0.snp.trailing).offset(20)
            $0.width.equalTo(80)
        }
        
        numberPadClear.snp.makeConstraints {
            $0.top.equalTo(numberPad1.snp.bottom).offset(10)
            $0.leading.equalTo(numberPadPoint.snp.trailing).offset(20)
            $0.width.equalTo(80)
        }
        
        padPlus.snp.makeConstraints {
            $0.top.equalTo(numberPad1.snp.bottom).offset(10)
            $0.leading.equalTo(numberPadClear.snp.trailing).offset(20)
            $0.width.equalTo(80)
        }
        
    }
}
