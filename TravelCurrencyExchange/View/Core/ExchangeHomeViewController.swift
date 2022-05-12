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
    
    private var pickerList: [CurrencyExchangeEntity] = []
    private var pickerItem: CurrencyExchangeEntity?
    
    private var toolbar: UIToolbar!
    private var exitBtn: UIBarButtonItem!
    private var picker: UIPickerView!
    
    //MARK: - Properties
    private let numberPadViewController = NumberPadViewController()
    
    private let registerButton = UIButton().then {
        $0.setTitle("등록", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(pushAddPage), for: .touchUpInside)
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
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .white
        $0.layer.cornerRadius = 5
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
        $0.backgroundColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.1137254902, alpha: 1)
    }
    
    private let usedTypeTextField = UITextField().then {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        inputMoneyLabel.text = ""
        calculatorLabel.text = "계산 금액"
        exchangeLabel.text = "오늘의 환율"
        usedTypeTextField.text = "국가 선택"
    }
    
    private func getExchange() {
        CurrencyExchangeAPI.shared.getExchange { result in
            self.pickerList.append(CurrencyExchangeEntity(result: 0, curUnit: "", ttb: "", tts: "", dealBasR: "", bkpr: "", yyEfeeR: "", tenDDEfeeR: "", kftcBkpr: "", kftcDealBasR: "", curNm: "국가를 선택해주세요 😁"))
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
        view.backgroundColor = #colorLiteral(red: 0.231372549, green: 0.231372549, blue: 0.2431372549, alpha: 1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @objc func pushAddPage() {
        if (inputMoneyLabel.text?.isEmpty)! {
            present(Utility.shared.alert(title: "알림", message: "계산 먼저 선택해주세요."), animated: true, completion: nil)
        } else {
            let bottomSheetVC = BottomSheetViewController()
            bottomSheetVC.countryValue.text = usedTypeTextField.text
            bottomSheetVC.todayCurrencyValue.text = exchangeLabel.text
            bottomSheetVC.inputValue.text = inputMoneyLabel.text
            bottomSheetVC.calculatorValue.text = calculatorLabel.text
            self.navigationController?.pushViewController(bottomSheetVC, animated: true)
        }
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
            $0.width.equalTo(180)
            $0.height.equalTo(50)
        }
        
        exchangeLabel.snp.makeConstraints {
            $0.top.equalTo(registerButton.snp.bottom).offset(20)
            $0.leading.equalTo(usedTypeTextField.snp.trailing).offset(10)
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
        if row == 0 {
            present(Utility.shared.alert(title: "알림", message: "다른 항목을 선택해주세요."), animated: true, completion: nil)
        } else {
            pickerItem = pickerList[row]
            guard var unit = pickerItem?.curUnit else { return }
            let deal = Double(pickerList[row].dealBasR.replacingOccurrences(of: ",", with: ""))
            let dealToString = String(round(deal!)).replacingOccurrences(of: ".0", with: "")
            
            if unit == "IDR(100)" || unit == "JPY(100)" {
                unit = unit.replacingOccurrences(of: "(100)", with: "")
                exchangeLabel.text = "100\(unit) = " + dealToString + " " + "원"
            } else {
                exchangeLabel.text = "1\(unit) = " + dealToString + " " + "원"
            }
            Utility.shared.attibuteChange(label: exchangeLabel, changeString: "원")
            
            usedTypeTextField.text = pickerList[row].curNm
            pickerList[row].dealBasR = dealToString
            inputMoneyLabel.text = ""
            calculatorLabel.text = "계산 금액"
            self.view.endEditing(true)
        }
    }
}

//MARK: - Calculator
extension ExchangeHomeViewController: sendDataDelegate {
    func sendData(clickNum: String, tag: Int) {
        if 0 <= tag && tag <= 9 {
            if pickerItem?.dealBasR != nil {
                guard var unit = pickerItem?.curUnit else { return }
                if unit == "IDR(100)" || unit == "JPY(100)" {
                    unit = unit.replacingOccurrences(of: "(100)", with: "")
                }
                let deal = round(Double(pickerItem!.dealBasR.replacingOccurrences(of: ",", with: ""))!)
                if !inputMoneyLabel.text!.isEmpty {
                    let replaceLabel = inputMoneyLabel.text!.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ",", with: "").replacingOccurrences(of: "\(unit)", with: "")
                    let labelNum = Double(inputMoneyLabel.text!.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ",", with: "").replacingOccurrences(of: "\(unit)", with: "")) ?? 0.0
                    
                    inputMoneyLabel.text = Utility.shared.numberFormatter(number: Int(replaceLabel + clickNum)!) + unit
                    calculatorLabel.text = Utility.shared.numberFormatter(number: Int(labelNum * deal)) + "원"
                } else {
                    let num = Double(clickNum) ?? 0.0
                    inputMoneyLabel.text = Utility.shared.numberFormatter(number: Int(clickNum)!) + unit
                    calculatorLabel.text = Utility.shared.numberFormatter(number: Int(num * deal)) + "원"
                }
                
                Utility.shared.attibuteChange(label: inputMoneyLabel, changeString: unit)
                Utility.shared.attibuteChange(label: calculatorLabel, changeString: "원")
            } else {
                present(Utility.shared.alert(title: "알림", message: "환율을 먼저 선택해주세요."), animated: true, completion: nil)
            }
        }else if tag == 11 {
            inputMoneyLabel.text = ""
            calculatorLabel.text = "계산 금액"
        }
    }
}
