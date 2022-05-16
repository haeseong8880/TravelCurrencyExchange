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
    
    var pickerList = ["사용 내역을 선택해 주세요 😁", "교통 🚎", "숙소 🏨" ,"식비 🍚", "쇼핑 🛍", "기타"]
    //    var pickerItemPrivate?
    
    var toolbar: UIToolbar!
    var exitBtn: UIBarButtonItem!
    var picker: UIPickerView!
    
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
    
    private let typeTextField = UITextField().then {
        $0.font = .systemFont(ofSize: 22, weight: .bold)
        $0.borderStyle = .roundedRect
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 16
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.backgroundColor = .darkGray
        $0.textColor = .white
        $0.textAlignment = .center
        $0.attributedPlaceholder = NSAttributedString(string: "사용 내역 선택", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
    private let inputUsedTextField = UITextField().then {
        $0.placeholder = "내역을 입력해주세요."
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 22)
        $0.layer.cornerRadius = 5
        $0.textColor = .white
        $0.backgroundColor = #colorLiteral(red: 0.3122541904, green: 0.418910563, blue: 0.6148851514, alpha: 1)
    }
    
    private let addDataButton = UIButton().then {
        $0.setTitle("등록", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 26, weight: .bold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(saveData), for: .touchUpInside)
    }
    
    //MARK: - Action
    @objc private func saveData() {
        let historyModel = UsedHistoryModel()
        historyModel.country = countryValue.text!
        historyModel.todayCurrency = todayCurrencyValue.text!
        historyModel.input = inputValue.text!
        historyModel.calculator = calculatorValue.text!
        historyModel.type = typeTextField.text!
        historyModel.inputUsed = inputUsedTextField.text!
        UsedHistoryManager.shared.saveUsedHisotry(history: historyModel) { result in
            if result {
                let alert = UIAlertController(title: "알림", message: "등록이 완료 되었습니다.", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "확인", style: .default) { action in
//                    UsedListViewController().tableView.beginUpdates()
//                    UsedListViewController().tableView.endUpdates()
                    self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(okAction)
                self.present(alert, animated: false, completion: nil)
            }
            UsedListViewController().viewDidAppear(true)
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfigure()
        layout()
        pickerConfigure()
    }
    
    private func viewConfigure() {
        view.backgroundColor = #colorLiteral(red: 0.2322605252, green: 0.2325651646, blue: 0.2418002784, alpha: 1)
        self.navigationItem.title = "사용 내역 등록"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    //MARK: - Layout
    private func layout() {
        [ countryLabel, countryValue, todayCurrencyLabel, todayCurrencyValue, inputLabel, inputValue, calculatorLabel, calculatorValue, typeTextField, inputUsedTextField, addDataButton ].forEach{ view.addSubview($0) }
        
        let screenWidth = Utility.shared.getDeviceWidth()
        
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
        
        typeTextField.snp.makeConstraints {
            $0.top.equalTo(calculatorValue.snp.bottom)
            $0.leading.equalToSuperview().inset(10)
            $0.width.equalTo(screenWidth / 2 - 15)
            $0.height.equalTo(50)
        }
        
        inputUsedTextField.snp.makeConstraints {
            $0.top.equalTo(calculatorValue.snp.bottom)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(screenWidth / 2 - 15)
            $0.height.equalTo(50)
        }
        
        addDataButton.snp.makeConstraints {
            $0.top.equalTo(inputUsedTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
    }
}

// MARK: = Picker
extension BottomSheetViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: - PickerConfigure
    private func pickerConfigure() {
        picker = UIPickerView()
        picker.delegate = self
        typeTextField.inputView = picker
        
        exitBtn = UIBarButtonItem()
        exitBtn.title = "닫기"
        exitBtn.target = self
        exitBtn.tintColor = .black
        exitBtn.action = #selector(pickerExit)
        
        toolbar = UIToolbar()
        toolbar.tintColor = .darkGray
        toolbar.frame = CGRect(x: 0, y: 0, width: 0, height: 40)
        toolbar.setItems([exitBtn], animated: true)
        
        typeTextField.inputAccessoryView = toolbar
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
        if row == 0 {
            present(Utility.shared.alert(title: "알림", message: "다른 항목을 선택해주세요."), animated: true, completion: nil)
        } else {
            typeTextField.text = pickerList[row]
        }
        self.view.endEditing(true)
    }
}
