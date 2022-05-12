//
//  ViewController.swift
//  TravelCurrencyExchange
//
//  Created by haeseongJung on 2022/05/02.
//

import UIKit
import RealmSwift

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("PATH => \(Realm.Configuration.defaultConfiguration.fileURL!)")
        bottomViewConfigure()
    }
    
    private func bottomViewConfigure() {
        
        let exchangeHomeViewController = UINavigationController(rootViewController: ExchangeHomeViewController())
        exchangeHomeViewController.tabBarItem = UITabBarItem(title: "환율", image: UIImage(systemName: "creditcard"), selectedImage: UIImage(systemName: "creditcard.fill"))
        
        let usedListViewController = UINavigationController(rootViewController: UsedListViewController())
        usedListViewController.tabBarItem = UITabBarItem(title: "사용 내역", image: UIImage(systemName: "list.bullet.rectangle.portrait"), selectedImage: UIImage(systemName: "list.bullet.rectangle.portrait.fill"))
        
        UITabBar.appearance().barTintColor = .orange
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.8228634, green: 0.7475447655, blue: 0.8044595122, alpha: 1)
        
        viewControllers = [ exchangeHomeViewController, usedListViewController ]
    }
}

