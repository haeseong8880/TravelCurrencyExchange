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
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2322605252, green: 0.2325651646, blue: 0.2418002784, alpha: 1)
        tableView.frame = .zero
        tableView.register(UsedListViewCell.self, forCellReuseIdentifier: "UsedListViewCell")
    }
}

extension UsedListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsedListViewCell", for: indexPath) as! UsedListViewCell
        cell.nameLabel.text = "aaa"
        return cell
    }
}
