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
        $0.font = .systemFont(ofSize: 22, weight: .bold)
        $0.textColor = #colorLiteral(red: 0.7080104947, green: 0.7711846828, blue: 0.8112627864, alpha: 1)
    }
    
    let currencyLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 22, weight: .bold)
        $0.textColor = #colorLiteral(red: 0.7080104947, green: 0.7711846828, blue: 0.8112627864, alpha: 1)
        $0.textAlignment = .right
    }
    
    private let inputLabelNoticeLabel = UILabel().then {
        $0.text = "사용한 금액"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = #colorLiteral(red: 0.7080104947, green: 0.7711846828, blue: 0.8112627864, alpha: 1)
    }
    
    let inputLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = #colorLiteral(red: 0.7080104947, green: 0.7711846828, blue: 0.8112627864, alpha: 1)
        $0.textAlignment = .right
    }
    
    let calculatorLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = #colorLiteral(red: 0.7080104947, green: 0.7711846828, blue: 0.8112627864, alpha: 1)
        $0.textAlignment = .right
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
        $0.textAlignment = .right
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = #colorLiteral(red: 0.2322605252, green: 0.2325651646, blue: 0.2418002784, alpha: 1)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    private func layout() {
        [ countryCellLabel, currencyLabel, inputLabelNoticeLabel, inputLabel, calculatorLabel, typeLabel, inputUsedLabel ].forEach { addSubview($0) }
        
        countryCellLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(Utility.shared.getDeviceWidth() / 2)
        }
        
        currencyLabel.snp.makeConstraints {
            $0.top.equalTo(countryCellLabel.snp.top)
            $0.leading.equalTo(countryCellLabel.snp.trailing)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        inputLabelNoticeLabel.snp.makeConstraints {
            $0.top.equalTo(currencyLabel.snp.bottom).offset(10)
            $0.bottom.equalTo(calculatorLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(Utility.shared.getDeviceWidth() / 2)
        }
        
        inputLabel.snp.makeConstraints {
            $0.top.equalTo(inputLabelNoticeLabel.snp.top)
            $0.leading.equalTo(inputLabelNoticeLabel.snp.trailing)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        calculatorLabel.snp.makeConstraints {
            $0.top.equalTo(inputLabel.snp.bottom).offset(10)
            $0.leading.equalTo(countryCellLabel.snp.leading)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        typeLabel.snp.makeConstraints {
            $0.top.equalTo(calculatorLabel.snp.bottom).offset(10)
            $0.leading.equalTo(countryCellLabel.snp.leading)
            $0.width.equalTo(100)
        }
        
        inputUsedLabel.snp.makeConstraints {
            $0.top.equalTo(typeLabel.snp.top).offset(10)
            $0.leading.equalTo(typeLabel.snp.trailing)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
}
