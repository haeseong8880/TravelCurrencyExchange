//
//  UsedHistoryManager.swift
//  TravelCurrencyExchange
//
//  Created by haeseongJung on 2022/05/12.
//

import Foundation
import RealmSwift

class UsedHistoryManager {
    static let shared: UsedHistoryManager = UsedHistoryManager()
    
    func getUsedHisotrys() -> [UsedHistoryModel] {
        do {
            let realm = try! Realm()
            let usedHistoryList = realm.objects(UsedHistoryModel.self)
            return Array(usedHistoryList)
        } catch {
            print("Error saveUsedHisotry \(error.localizedDescription)")
        }
    }
    
    func saveUsedHisotry(history: UsedHistoryModel, onSuccess: @escaping ((Bool) -> Void)) {
        do {
            let realm = try! Realm()
            history.id = autoIncrementID()
            try realm.write{
                realm.add(history)
            }
            onSuccess(true)
        } catch {
            print("saveMember => \(error.localizedDescription)")
        }
    }
    
    private func autoIncrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(UsedHistoryModel.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
}
