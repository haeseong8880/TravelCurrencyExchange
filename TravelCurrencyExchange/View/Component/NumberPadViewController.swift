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

protocol sendDataDelegate {
    func sendData(clickNum: String, sign: Bool)
}

class NumberPadViewController: UIView {
    
    var delegate: sendDataDelegate?
    
    //MARK: - Properties
    private let numberPad7 = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 13
        $0.setTitle("7", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    private let numberPad8 = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 13
        $0.setTitle("8", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    private let numberPad9 = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 13
        $0.setTitle("9", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    private let numberPad4 = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 13
        $0.setTitle("4", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    private let numberPad5 = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 13
        $0.setTitle("5", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    private let numberPad6 = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 13
        $0.setTitle("6", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    private let numberPad1 = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 13
        $0.setTitle("1", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    private let numberPad2 = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 13
        $0.setTitle("2", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    private let numberPad3 = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 13
        $0.setTitle("3", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    private let numberPad0 = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 13
        $0.setTitle("0", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    private let numberPadPoint = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 13
        $0.setTitle(".", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    private let numberPadClear = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 13
        $0.setTitle("C", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    private let padDivision = UIButton().then {
        $0.backgroundColor = .systemOrange
        $0.layer.cornerRadius = 13
        $0.setTitle("÷", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    private let padMultiply = UIButton().then {
        $0.backgroundColor = .systemOrange
        $0.layer.cornerRadius = 13
        $0.setTitle("×", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    private let padMinus = UIButton().then {
        $0.backgroundColor = .systemOrange
        $0.layer.cornerRadius = 13
        $0.setTitle("-", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    private let padPlus = UIButton().then {
        $0.backgroundColor = .systemOrange
        $0.layer.cornerRadius = 13
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        $0.contentHorizontalAlignment = .center
        $0.addTarget(self, action: #selector(numberClick), for: .touchUpInside)
    }
    
    // MARK: - Action
    @objc func numberClick(sender: UIButton) {
        if let clickNum = sender.titleLabel?.text {
            let convertor = Int(clickNum)
            self.delegate?.sendData(clickNum: clickNum, sign: convertor != nil ? true : false)
        }
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
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHight = UIScreen.main.bounds.size.height
        
        numberPad7.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
        }
        
        numberPad8.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(10)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
            $0.leading.equalTo(numberPad7.snp.trailing).offset(10)
        }
        
        numberPad9.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(10)
            $0.leading.equalTo(numberPad8.snp.trailing).offset(10)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
        }
        
        padDivision.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(10)
            $0.leading.equalTo(numberPad9.snp.trailing).offset(10)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
        }
        
        numberPad4.snp.makeConstraints {
            $0.top.equalTo(numberPad7.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
        }
        
        numberPad5.snp.makeConstraints {
            $0.top.equalTo(numberPad7.snp.bottom).offset(10)
            $0.leading.equalTo(numberPad4.snp.trailing).offset(10)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
        }
        
        numberPad6.snp.makeConstraints {
            $0.top.equalTo(numberPad7.snp.bottom).offset(10)
            $0.leading.equalTo(numberPad5.snp.trailing).offset(10)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
        }
        
        padMultiply.snp.makeConstraints {
            $0.top.equalTo(numberPad7.snp.bottom).offset(10)
            $0.leading.equalTo(numberPad6.snp.trailing).offset(10)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
        }
        
        numberPad1.snp.makeConstraints {
            $0.top.equalTo(numberPad4.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
        }
        
        numberPad2.snp.makeConstraints {
            $0.top.equalTo(numberPad4.snp.bottom).offset(10)
            $0.leading.equalTo(numberPad1.snp.trailing).offset(10)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
        }
        
        numberPad3.snp.makeConstraints {
            $0.top.equalTo(numberPad4.snp.bottom).offset(10)
            $0.leading.equalTo(numberPad2.snp.trailing).offset(10)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
        }
        
        padMinus.snp.makeConstraints {
            $0.top.equalTo(numberPad4.snp.bottom).offset(10)
            $0.leading.equalTo(numberPad3.snp.trailing).offset(10)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
        }
        
        numberPad0.snp.makeConstraints {
            $0.top.equalTo(numberPad1.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
        }
        
        numberPadPoint.snp.makeConstraints {
            $0.top.equalTo(numberPad1.snp.bottom).offset(10)
            $0.leading.equalTo(numberPad0.snp.trailing).offset(10)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
        }
        
        numberPadClear.snp.makeConstraints {
            $0.top.equalTo(numberPad1.snp.bottom).offset(10)
            $0.leading.equalTo(numberPadPoint.snp.trailing).offset(10)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
        }
        
        padPlus.snp.makeConstraints {
            $0.top.equalTo(numberPad1.snp.bottom).offset(10)
            $0.leading.equalTo(numberPadClear.snp.trailing).offset(10)
            $0.width.equalTo(screenWidth / 4 - 15)
            $0.height.equalTo(screenHight / 8 - 30)
        }
        
    }
}
