//
//  AddList.swift
//  TravelCurrencyExchange
//
//  Created by haeseongJung on 2022/05/07.
//

import UIKit
import Then
import SnapKit

class UsedListViewController: UITableViewController {
    
    //MARK: - Properties
    private var usedHistoryList: [UsedHistoryModel] = []
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2322605252, green: 0.2325651646, blue: 0.2418002784, alpha: 1)
        tableView.frame = .zero
        tableView.register(UsedListViewCell.self, forCellReuseIdentifier: "UsedListViewCell")
        
        getAllUsedHistory()
    }
    
    private func getAllUsedHistory() {
        let items: [UsedHistoryModel] = UsedHistoryManager.shared.getUsedHisotrys()
        if items.count > 0 {
            items.forEach {
                usedHistoryList.append($0)
            }
        }
    }
    
    func popup(titleText: String, placeholderText: String, index: Int) {
        let alert = UIAlertController(title: titleText,message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        //            alert.addTextField { (textField) in
        //                textField.placeholder = placeholderText
        //                if type == .money { textField.keyboardType = .numberPad }
        //            }
        
        alert.addAction(UIAlertAction(title: "수정", style: .default, handler: {[weak self] action in
            //                guard let self = self else { return }
            //                if let result = alert.textFields?.first?.text {
            //                    MemberManager.shared.updateMember(with: self.memberList[index], newData: result, type: type) { resultBool in
            //                        if resultBool {
            //                            if type == .name { self.memberList[index].name = result }
            //                            else if type == .money { self.memberList[index].money = result + "원" }
            //                            self.reloadData()
            //                        }
            //                    }
            //                }
        }))
        view.window?.rootViewController?.present(alert, animated: true)
    }
    
    private func deletePopUp(index: IndexPath) {
        let alert = UIAlertController(title: nil, message: "멤버를 삭제할까요?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "네", style: .default) { _ in
            UsedHistoryManager.shared.deleteUsedHistory(history:
                                                            self.usedHistoryList[index.row]) { result in
                if result {
                    print("Delete Success!!")
                    self.usedHistoryList.remove(at: index.row)
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
        let nameEdting = UIContextualAction(style: .normal, title: "이름 수정") { (action, view, completionHandler) in
            self.popup(titleText: "이름 수정", placeholderText: "수정 할 이름을 입력해주세요.", index: indexPath.row)
            completionHandler(true)
        }
        let moneyEdting = UIContextualAction(style: .normal, title: "금액 수정") { (action, view, completionHandler) in
            self.popup(titleText: "금액 수정", placeholderText: "수정 할 금액을 입력해주세요.", index: indexPath.row)
            completionHandler(true)
        }
        let deleteAction = UIContextualAction(style: .normal, title: "삭제") { (action, view, completionHandler) in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.deletePopUp(index: indexPath)
                completionHandler(true)
            }
        }
        
        nameEdting.backgroundColor = .systemBlue
        moneyEdting.backgroundColor = .systemGray
        deleteAction.backgroundColor = .systemRed
        
        let configure = UISwipeActionsConfiguration(actions:[ nameEdting, moneyEdting, deleteAction ])
        configure.performsFirstActionWithFullSwipe = false
        return configure
    }
}
