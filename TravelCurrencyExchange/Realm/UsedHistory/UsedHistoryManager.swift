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
            print("saveUsedHisotry => \(error.localizedDescription)")
        }
    }
    
    private func autoIncrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(UsedHistoryModel.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
    func deleteUsedHistory(history: UsedHistoryModel, onSuccess: @escaping ((Bool) -> Void)) {
        do {
            let realm = try! Realm()
            guard let data = realm.objects(UsedHistoryModel.self).filter("id == %@", history.id).first else { return }
            try realm.write {
                realm.delete(data)
            }
            onSuccess(true)
        } catch {
            print("deleteUsedHistory => \(error.localizedDescription)")
        }
    }
    
    func updateHistory(history: UsedHistoryModel, updateData: String ,type: SwipeActionEnum, onSuccess: @escaping ((Bool) -> Void)) {
        do {
            let realm = try! Realm()
            guard let data = realm.objects(UsedHistoryModel.self).filter("id == %@", history.id).first else { return }
            print(history.todayCurrency)
//            if type == .money {
//                print(history.todayCurrency)
//                try realm.write {
//                    history.input = updateData
//                }
//            }
//            else if type == .etc {
//                try realm.write {
//                    history.inputUsed = updateData
//                }
//            }
            print(data)
            onSuccess(true)
        } catch {
            print("updateMember => \(error.localizedDescription)")
        }
    }
}
