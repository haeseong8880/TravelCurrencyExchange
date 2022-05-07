//
//  ViewController.swift
//  TravelCurrencyExchange
//
//  Created by haeseongJung on 2022/05/02.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        bottomViewConfigure()
        
    }
    
    private func bottomViewConfigure() {
        
        let exchangeHomeViewController = UINavigationController(rootViewController: ExchangeHomeViewController())
        exchangeHomeViewController.tabBarItem = UITabBarItem(title: "환율", image: UIImage(systemName: "creditcard"), selectedImage: UIImage(systemName: "creditcard.fill"))
        
        let addListViewController = UINavigationController(rootViewController: AddListViewController())
        addListViewController.tabBarItem = UITabBarItem(title: "리스트", image: UIImage(systemName: "list.bullet.rectangle.portrait"), selectedImage: UIImage(systemName: "list.bullet.rectangle.portrait.fill"))
        
        UITabBar.appearance().barTintColor = .orange
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.8228634, green: 0.7475447655, blue: 0.8044595122, alpha: 1)
        
        viewControllers = [ exchangeHomeViewController, addListViewController ]
    }
}

