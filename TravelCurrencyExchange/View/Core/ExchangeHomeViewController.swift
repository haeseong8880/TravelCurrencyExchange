//
//  ExchangeHome.swift
//  TravelCurrencyExchange
//
//  Created by haeseongJung on 2022/05/03.
//

import UIKit
import Then
import SnapKit

class ExchangeHomeViewController: UIViewController {
    
    var pickerList: [CurrencyExchangeEntity] = []
    var pickerItem: CurrencyExchangeEntity?
    
    var toolbar: UIToolbar!
    var exitBtn: UIBarButtonItem!
    var picker: UIPickerView!
    
    //MARK: - Properties
    private let numberPadViewController = NumberPadViewController()
    
    private let registerButton = UIButton().then {
        $0.setTitle("등록", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(addData), for: .touchUpInside)
    }
    
    private let noticeLabel = UILabel().then {
        $0.text = "한국수출입은행 환율 정보 기반 환율"
        $0.numberOfLines = 2
        $0.lineBreakMode = NSLineBreakMode.byWordWrapping
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
    }
    
    private let standardDate = UILabel().then {
        $0.text = "2022-05-03"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
    }
    
    private let exchangeLabel = UILabel().then {
        $0.text = "오늘의 환율"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .white
        $0.layer.cornerRadius = 16
        $0.layer.masksToBounds = true
        $0.backgroundColor = #colorLiteral(red: 0.5019607843, green: 0.5333333333, blue: 0.6980392157, alpha: 1)
    }
    
    private let inputMoneyLabel = UILabel().then {
        $0.text = ""
        $0.textAlignment = .right
        $0.font = .systemFont(ofSize: 40, weight: .bold)
        $0.textColor = .white
        $0.layer.cornerRadius = 16
        $0.layer.masksToBounds = true
        $0.backgroundColor = #colorLiteral(red: 0.3122541904, green: 0.418910563, blue: 0.6148851514, alpha: 1)
    }
    
    private let calculatorLabel = UILabel().then {
        $0.text = "계산 금액"
        $0.textAlignment = .right
        $0.font = .systemFont(ofSize: 40, weight: .bold)
        $0.textColor = .white
        $0.layer.cornerRadius = 16
        $0.layer.masksToBounds = true
        $0.backgroundColor = #colorLiteral(red: 0.06474008411, green: 0.06667540222, blue: 0.1130684391, alpha: 1)
    }
    
    private let usedTypeTextField = UITextField().then {
        $0.font = .systemFont(ofSize: 22, weight: .bold)
        $0.borderStyle = .roundedRect
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 16
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.backgroundColor = .darkGray
        $0.textColor = .white
        $0.textAlignment = .center
        $0.attributedPlaceholder = NSAttributedString(string: "국가 선택", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfigure()
        layout()
        pickerConfigure()
        getExchange()
        getToday()
        let numberPad = numberPadViewController
        numberPad.delegate = self
    }
    
    private func getExchange() {
        CurrencyExchangeAPI.shared.getExchange { result in
            result.forEach { item in
                self.pickerList.append(item)
            }
        }
    }
    private func getToday() {
        let now = Date()
        
        let date = DateFormatter()
        date.locale = Locale(identifier: "ko_kr")
        date.timeZone = TimeZone(abbreviation: "KST")
        date.dateFormat = "yyyy-MM-dd"

        let kr = date.string(from: now)
        standardDate.text = kr
    }
    
    // MARK: - viewConfigure
    private func viewConfigure() {
        view.backgroundColor = #colorLiteral(red: 0.2322605252, green: 0.2325651646, blue: 0.2418002784, alpha: 1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @objc func addData() {
        print("pickerItem =====>>>>  \(pickerItem)")
    }
    
    // MARK: - Layout
    private func layout() {
        [ registerButton, noticeLabel, standardDate, usedTypeTextField, exchangeLabel, inputMoneyLabel, calculatorLabel, numberPadViewController ].forEach {
            view.addSubview($0)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(120)
            $0.height.equalTo(40)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.leading.equalToSuperview().inset(10)
            $0.trailing.equalTo(registerButton.snp.leading)
            $0.height.equalTo(20)
        }

        standardDate.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(10)
            $0.trailing.equalTo(noticeLabel.snp.trailing)
            $0.height.equalTo(20)
        }
        
        usedTypeTextField.snp.makeConstraints {
            $0.top.equalTo(registerButton.snp.bottom).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }
        
        exchangeLabel.snp.makeConstraints {
            $0.top.equalTo(registerButton.snp.bottom).offset(20)
            $0.leading.equalTo(usedTypeTextField.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(50)
        }
        
        inputMoneyLabel.snp.makeConstraints {
            $0.top.equalTo(exchangeLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(80)
        }
        
        calculatorLabel.snp.makeConstraints {
            $0.top.equalTo(inputMoneyLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(80)
        }
        
        numberPadViewController.snp.makeConstraints {
            $0.top.equalTo(calculatorLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


// MARK: = Picker
extension ExchangeHomeViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    // MARK: - PickerConfigure
    private func pickerConfigure() {
        picker = UIPickerView()
        picker.delegate = self
        usedTypeTextField.inputView = picker
        
        exitBtn = UIBarButtonItem()
        exitBtn.title = "닫기"
        exitBtn.target = self
        exitBtn.tintColor = .black
        exitBtn.action = #selector(pickerExit)
        
        toolbar = UIToolbar()
        toolbar.tintColor = .darkGray
        toolbar.frame = CGRect(x: 0, y: 0, width: 0, height: 40)
        toolbar.setItems([exitBtn], animated: true)
        
        usedTypeTextField.inputAccessoryView = toolbar
    }
    
    // MARK: - PickerAction
    @objc func pickerExit() {
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerList[row].curNm
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerItem = pickerList[row]
        
        guard let unit = pickerItem?.curUnit else { return }
        let deal = Double(pickerList[row].dealBasR.replacingOccurrences(of: ",", with: ""))
        let dealToString = String(round(deal!)).replacingOccurrences(of: ".0", with: "")
        
        exchangeLabel.text = dealToString + " " + unit
        attibuteChange(label: exchangeLabel, changeString: unit)
        
        usedTypeTextField.text = pickerList[row].curNm
        pickerList[row].dealBasR = dealToString
        inputMoneyLabel.text = ""
        calculatorLabel.text = "계산 금액"
        self.view.endEditing(true)
    }
}

//MARK: - Calculator
extension ExchangeHomeViewController: sendDataDelegate {
    func sendData(clickNum: String, tag: Int) {
        if 0 <= tag && tag <= 9 {
            if pickerItem?.dealBasR != nil {
                guard let unit = pickerItem?.curUnit else { return }
                let deal = Double(pickerItem!.dealBasR.replacingOccurrences(of: ",", with: ""))
                if !inputMoneyLabel.text!.isEmpty {
                    let replaceLabel = inputMoneyLabel.text!.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ",", with: "").replacingOccurrences(of: "\(unit)", with: "")
                    let labelNum = Double(inputMoneyLabel.text!.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ",", with: "").replacingOccurrences(of: "\(unit)", with: "")) ?? 0.0
                    
                    inputMoneyLabel.text = Utility.shared.numberFormatter(number: Int(replaceLabel + clickNum)!) + unit
                    calculatorLabel.text = Utility.shared.numberFormatter(number: Int(labelNum * deal!)) + "원"
                } else {
                    let num = Double(clickNum) ?? 0.0
                    inputMoneyLabel.text = Utility.shared.numberFormatter(number: Int(clickNum)!) + unit
                    calculatorLabel.text = Utility.shared.numberFormatter(number: Int(num * deal!)) + "원"
                }
                
                attibuteChange(label: inputMoneyLabel, changeString: unit)
                attibuteChange(label: calculatorLabel, changeString: "원")
            } else {
                let alert = UIAlertController(title: "알림", message: "환율을 먼저 선택해주세요.", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in }
                alert.addAction(okAction)
                present(alert, animated: false, completion: nil)
            }
        }else if tag == 11 {
            inputMoneyLabel.text = ""
            calculatorLabel.text = "계산 금액"
        }
    }
    
    private func attibuteChange(label: UILabel, changeString: String) {
        let attributedinputMoney = NSMutableAttributedString(string: label.text!)
        attributedinputMoney.addAttribute(.foregroundColor, value: UIColor.lightGray, range: (label.text! as NSString).range(of: changeString))
        attributedinputMoney.addAttribute(.font, value: UIFont.systemFont(ofSize: 22), range: (label.text! as NSString).range(of: changeString))
        label.attributedText = attributedinputMoney
    }
}
