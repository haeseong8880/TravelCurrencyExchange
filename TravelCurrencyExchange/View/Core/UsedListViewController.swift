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
}

extension UsedListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedHistoryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsedListViewCell", for: indexPath) as! UsedListViewCell
        cell.countryCellLabel.text = usedHistoryList[indexPath.row].country
        cell.currencyLabel.text = usedHistoryList[indexPath.row].todayCurrency
        cell.inputLabel.text = usedHistoryList[indexPath.row].input
        cell.calculatorLabel.text = usedHistoryList[indexPath.row].calculator
        cell.typeLabel.text = usedHistoryList[indexPath.row].type
        cell.inputUsedLabel.text = usedHistoryList[indexPath.row].inputUsed
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
