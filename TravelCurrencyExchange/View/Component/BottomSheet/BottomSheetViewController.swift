//
//  BottomSheetViewController.swift
//  TravelCurrencyExchange
//
//  Created by haeseongJung on 2022/05/10.
//

import UIKit
import SnapKit
import Then

class BottomSheetViewController: UIViewController {
    
    //MARK: - Properties
    private let countryLabel = UILabel().then {
        $0.text = "단위 국가  ➡️"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 26, weight: .bold)
    }
    
    private let todayCurrencyLabel = UILabel().then {
        $0.text = "적용 환율  ➡️"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 26, weight: .bold)
    }
    
    private let inputLabel = UILabel().then {
        $0.text = "사용 금액  ➡️"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 26, weight: .bold)
    }
    
    private let calculatorLabel = UILabel().then {
        $0.text = "계산 금액  ➡️"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 26, weight: .bold)
    }
    
    let countryValue = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .right
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    let todayCurrencyValue = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .right
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    let inputValue = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .right
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    let calculatorValue = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .right
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfigure()
        layout()
    }
    
    //MARK: - Layout
    private func layout() {
        [ countryLabel, countryValue, todayCurrencyLabel, todayCurrencyValue, inputLabel, inputValue, calculatorLabel, calculatorValue ].forEach{ view.addSubview($0) }
        
        countryLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.equalToSuperview().inset(10)
            $0.width.equalTo(160)
            $0.height.equalTo(60)
        }
        
        countryValue.snp.makeConstraints {
            $0.top.equalTo(countryLabel.snp.top)
            $0.leading.equalTo(countryLabel.snp.trailing)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(60)
        }
        
        todayCurrencyLabel.snp.makeConstraints {
            $0.top.equalTo(countryLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(10)
            $0.width.equalTo(160)
            $0.height.equalTo(60)
        }
        
        todayCurrencyValue.snp.makeConstraints {
            $0.top.equalTo(todayCurrencyLabel.snp.top)
            $0.leading.equalTo(todayCurrencyLabel.snp.trailing)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(60)
        }
        
        inputLabel.snp.makeConstraints {
            $0.top.equalTo(todayCurrencyLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(10)
            $0.width.equalTo(160)
            $0.height.equalTo(60)
        }
        
        inputValue.snp.makeConstraints {
            $0.top.equalTo(inputLabel.snp.top)
            $0.leading.equalTo(inputLabel.snp.trailing)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(60)
        }
        
        calculatorLabel.snp.makeConstraints {
            $0.top.equalTo(inputLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(10)
            $0.width.equalTo(160)
            $0.height.equalTo(60)
        }
        
        calculatorValue.snp.makeConstraints {
            $0.top.equalTo(calculatorLabel.snp.top)
            $0.leading.equalTo(calculatorLabel.snp.trailing)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(60)
        }
    }
    
    private func viewConfigure() {
        view.backgroundColor = #colorLiteral(red: 0.2322605252, green: 0.2325651646, blue: 0.2418002784, alpha: 1)
        self.navigationItem.title = "사용 내역 등록"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
}
