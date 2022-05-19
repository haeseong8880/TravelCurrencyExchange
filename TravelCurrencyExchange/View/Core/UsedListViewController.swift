//
//  AddList.swift
//  TravelCurrencyExchange
//
//  Created by haeseongJung on 2022/05/07.
//

import UIKit
import Then
import SnapKit

enum SwipeActionEnum {
    case money
    case etc
}

class UsedListViewController: UITableViewController {
    
    //MARK: - Properties
    private var usedHistoryList: [UsedHistoryModel] = []
    
    private let noDataNoticeLabel = UILabel().then {
        $0.text = "데이터가 존재하지 않습니다."
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 30, weight: .bold)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2322605252, green: 0.2325651646, blue: 0.2418002784, alpha: 1)
        tableView.frame = .zero
        tableView.register(UsedListViewCell.self, forCellReuseIdentifier: "UsedListViewCell")
        Layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllUsedHistory()
    }
    
    private func getAllUsedHistory() {
        usedHistoryList.removeAll()
        let items: [UsedHistoryModel] = UsedHistoryManager.shared.getUsedHisotrys()
        DispatchQueue.main.async {
            if items.count > 0 {
                self.noDataNoticeLabel.isHidden = true
                items.forEach {
                    self.usedHistoryList.append($0)
                }
            } else {
                self.noDataNoticeLabel.isHidden = false
            }
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Layout
    private func Layout() {
        [noDataNoticeLabel].forEach {
            view.addSubview($0)
        }
        
        noDataNoticeLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    func tableViewReloadData() {
        DispatchQueue.main.async {
            self.getAllUsedHistory()
        }
    }
    
    func popup(titleText: String, placeholderText: String, index: Int, enumType: SwipeActionEnum) {
        let alert = UIAlertController(title: titleText,message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        alert.addTextField { (textField) in
            textField.placeholder = placeholderText
            if enumType == .money { textField.keyboardType = .numberPad }
        }
        
        alert.addAction(UIAlertAction(title: "수정", style: .default, handler: {[weak self] action in
            guard let self = self else { return }
            if let result = alert.textFields?.first?.text {
                DispatchQueue.main.async {
                    UsedHistoryManager.shared.updateHistory(history: self.usedHistoryList[index], updateData: result, type: enumType) {
                        if $0 {
                            if enumType == .money { self.usedHistoryList[index].input = result }
                            else if enumType == .etc { self.usedHistoryList[index].inputUsed = result}
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }))
        view.window?.rootViewController?.present(alert, animated: true)
    }
    
    private func deletePopUp(index: IndexPath) {
        let alert = UIAlertController(title: nil, message: "멤버를 삭제할까요?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "네", style: .default) { _ in
            UsedHistoryManager.shared.deleteUsedHistory(history:
                                                            self.usedHistoryList[index.row]) { result in
                if result {
                    self.usedHistoryList.remove(at: index.row)
                    if self.usedHistoryList.count <= 0 {
                        self.noDataNoticeLabel.isHidden = false
                    }else {
                        self.noDataNoticeLabel.isHidden = true
                    }
                    self.tableView.reloadData()
                }
            }
        }
        alert.addAction(yesAction)
        let noAction = UIAlertAction(title: "아니오", style: .cancel) { _ in }
        alert.addAction(noAction)
        view.window?.rootViewController?.present(alert, animated: true)
    }
}

extension UsedListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedHistoryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let clickingBackground = UIView()
        clickingBackground.backgroundColor = #colorLiteral(red: 0.2322605252, green: 0.2325651646, blue: 0.2418002784, alpha: 1)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsedListViewCell", for: indexPath) as! UsedListViewCell
        cell.countryCellLabel.text = usedHistoryList[indexPath.row].country
        cell.currencyLabel.text = usedHistoryList[indexPath.row].todayCurrency
        cell.inputLabel.text = usedHistoryList[indexPath.row].input
        cell.calculatorLabel.text = usedHistoryList[indexPath.row].calculator
        cell.typeLabel.text = usedHistoryList[indexPath.row].type
        cell.inputUsedLabel.text = usedHistoryList[indexPath.row].inputUsed
        
        cell.selectedBackgroundView = clickingBackground
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let moneyEdting = UIContextualAction(style: .normal, title: "금액 수정") { (action, view, completionHandler) in
            self.popup(titleText: "금액 수정", placeholderText: "수정 할 금액을 입력해주세요.", index: indexPath.row, enumType: .money)
            completionHandler(true)
        }
        
        let etcEdting = UIContextualAction(style: .normal, title: "내용 수정") { (action, view, completionHandler) in
            self.popup(titleText: "내용 수정", placeholderText: "수정 할 내용을 입력해주세요.", index: indexPath.row, enumType: .etc)
            completionHandler(true)
        }
        
        let deleteAction = UIContextualAction(style: .normal, title: "삭제") { (action, view, completionHandler) in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.deletePopUp(index: indexPath)
                completionHandler(true)
            }
        }
        
        etcEdting.backgroundColor = .systemBlue
        moneyEdting.backgroundColor = .systemGray
        deleteAction.backgroundColor = .systemRed
        
        let configure = UISwipeActionsConfiguration(actions:[ moneyEdting, etcEdting , deleteAction ])
        configure.performsFirstActionWithFullSwipe = false
        return configure
    }
}
