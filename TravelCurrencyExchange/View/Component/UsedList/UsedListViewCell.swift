//
//  UsedListViewCell.swift
//  TravelCurrencyExchange
//
//  Created by haeseongJung on 2022/05/10.
//

import UIKit
import SnapKit
import Then

class UsedListViewCell: UITableViewCell {
    
    //MARK: - Properties
    let countryCellLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = #colorLiteral(red: 0.7080104947, green: 0.7711846828, blue: 0.8112627864, alpha: 1)
    }
    
    let currencyLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = #colorLiteral(red: 0.7080104947, green: 0.7711846828, blue: 0.8112627864, alpha: 1)
    }
    
    let inputLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = #colorLiteral(red: 0.7080104947, green: 0.7711846828, blue: 0.8112627864, alpha: 1)
    }
    
    let calculatorLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = #colorLiteral(red: 0.7080104947, green: 0.7711846828, blue: 0.8112627864, alpha: 1)
    }
    
    let typeLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = #colorLiteral(red: 0.7080104947, green: 0.7711846828, blue: 0.8112627864, alpha: 1)
    }
    
    let inputUsedLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = #colorLiteral(red: 0.7080104947, green: 0.7711846828, blue: 0.8112627864, alpha: 1)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.backgroundColor = #colorLiteral(red: 0.2322605252, green: 0.2325651646, blue: 0.2418002784, alpha: 1)
        self.backgroundColor = .white
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    private func layout() {
        [ countryCellLabel, currencyLabel, inputLabel, calculatorLabel, typeLabel, inputUsedLabel ].forEach { addSubview($0) }
        
        countryCellLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        currencyLabel.snp.makeConstraints {
            $0.top.equalTo(countryCellLabel.snp.bottom).offset(10)
            $0.leading.equalTo(countryCellLabel.snp.leading)
            $0.trailing.equalToSuperview()
        }
        
        inputLabel.snp.makeConstraints {
            $0.top.equalTo(currencyLabel.snp.bottom).offset(10)
            $0.leading.equalTo(countryCellLabel.snp.leading)
            $0.trailing.equalToSuperview()
        }
        
        calculatorLabel.snp.makeConstraints {
            $0.top.equalTo(inputLabel.snp.bottom).offset(10)
            $0.leading.equalTo(countryCellLabel.snp.leading)
            $0.trailing.equalToSuperview()
        }
        
        typeLabel.snp.makeConstraints {
            $0.top.equalTo(calculatorLabel.snp.bottom).offset(10)
            $0.leading.equalTo(countryCellLabel.snp.leading)
            $0.trailing.equalToSuperview()
        }
        
        inputUsedLabel.snp.makeConstraints {
            $0.top.equalTo(typeLabel.snp.bottom).offset(10)
            $0.leading.equalTo(countryCellLabel.snp.leading)
            $0.trailing.equalToSuperview()
        }
    }
}
