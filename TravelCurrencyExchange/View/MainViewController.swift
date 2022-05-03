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
        
        viewControllers = [ exchangeHomeViewController ]
    }
}

