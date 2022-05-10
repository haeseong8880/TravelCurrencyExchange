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
    let nameLabel = UILabel().then {
        $0.text = "AAaaaaaa"
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
        [ nameLabel ].forEach { addSubview($0) }
        
        nameLabel.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
