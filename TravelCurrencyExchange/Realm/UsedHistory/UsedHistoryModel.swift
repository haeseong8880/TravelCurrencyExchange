//
//  UsedHistoryModel.swift
//  TravelCurrencyExchange
//
//  Created by haeseongJung on 2022/05/12.
//

import Foundation
import RealmSwift

class UsedHistoryModel: Object {
    @Persisted var id: Int = 0
    @Persisted var country: String = ""
    @Persisted var todayCurrency: String = ""
    @Persisted var input: String = ""
    @Persisted var calculator: String = ""
    @Persisted var type: String = ""
    @Persisted var inputUsed: String = ""
    
    // id 가 고유 값입니다.
    override static func primaryKey() -> String? {
        return "id"
    }
}
