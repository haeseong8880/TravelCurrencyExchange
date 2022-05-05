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
    
    var pickerList = ["교통 🚎", "숙박 🏨", "식비 🍚", "쇼핑 🛍", "기타"]
    
    var toolbar: UIToolbar!
    var exitBtn: UIBarButtonItem!
    var picker: UIPickerView!
    
    var calSignTagNum: Int?
    var beforeNum: Double?
    
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
        $0.text = "환율이 상이 할 수 있습니다."
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
    }
    
    private let standardDate = UILabel().then {
        $0.text = "2022-05-03"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
    }
    
    private let exchangeLabel = UILabel().then {
        $0.text = "환율 자리!!"
        $0.textAlignment = .right
        $0.font = .systemFont(ofSize: 30, weight: .bold)
        $0.textColor = .white
        $0.backgroundColor = .red
    }
    
    private let inputMoneyLabel = UILabel().then {
        $0.text = ""
        $0.textAlignment = .right
        $0.font = .systemFont(ofSize: 70, weight: .bold)
        $0.textColor = .white
        $0.backgroundColor = .brown
    }
    
    private let usedTypeTextField = UITextField().then {
        $0.font = .systemFont(ofSize: 22, weight: .light)
        $0.borderStyle = .roundedRect
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.backgroundColor = .darkGray
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfigure()
        layout()
        pickerConfigure()
        
        let numberPad = numberPadViewController
        numberPad.delegate = self
    }
    
    // MARK: - viewConfigure
    private func viewConfigure() {
        view.backgroundColor = .black
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @objc func addData() {
    }
    
    // MARK: - Layout
    private func layout() {
        [ registerButton, noticeLabel, standardDate, usedTypeTextField, exchangeLabel, inputMoneyLabel, numberPadViewController ].forEach {
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
            $0.height.equalTo(20)
            $0.width.equalTo(180)
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
            $0.width.equalTo(150)
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
        
        numberPadViewController.snp.makeConstraints {
            $0.top.equalTo(inputMoneyLabel.snp.bottom).offset(10)
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
        return pickerList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerList[row])
        usedTypeTextField.text = pickerList[row]
        self.view.endEditing(true)
    }
}

//MARK: - Calculator
extension ExchangeHomeViewController: sendDataDelegate {
    
    
    func sendData(clickNum: String, tag: Int) {
        var num = Double(clickNum) ?? 0.0
        var labelNum = Double(inputMoneyLabel.text!) ?? 0.0
        if 0 <= tag && tag <= 9 {
            if !inputMoneyLabel.text!.isEmpty {
                inputMoneyLabel.text = inputMoneyLabel.text! + clickNum
            } else {
                inputMoneyLabel.text = "\(clickNum)"
            }
        }else {
            if tag == 11 {
                inputMoneyLabel.text = ""
                calSignTagNum = nil
                beforeNum = nil
            } else if 12 <= tag && tag <= 15{
                calSignTagNum = tag
                inputMoneyLabel.text = ""
                beforeNum = labelNum
            } else if tag == 16 {
                if calSignTagNum == 12 {
                    inputMoneyLabel.text = "\(beforeNum! / labelNum)"
                } else if calSignTagNum == 13 {
                    inputMoneyLabel.text = "\(beforeNum! * labelNum)"
                } else if calSignTagNum == 14 {
                    inputMoneyLabel.text = "\(beforeNum! - labelNum)"
                } else if calSignTagNum == 15 {
                    inputMoneyLabel.text = "\(beforeNum! + labelNum)"
                }
            }
        }
    }
}
