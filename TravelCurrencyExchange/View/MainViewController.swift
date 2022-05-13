//
//  ViewController.swift
//  TravelCurrencyExchange
//
//  Created by haeseongJung on 2022/05/02.
//

import UIKit
import RealmSwift
import Lottie
import Then

class MainViewController: UITabBarController {

    private let animationView: AnimationView = {
        let aniView = AnimationView(name: "69849-travel")
        aniView.frame = CGRect(x: 0, y: 0, width: Utility.shared.getDeviceWidth(), height: 500)
        aniView.contentMode = .scaleAspectFill
        return aniView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        view.addSubview(animationView)
        view.backgroundColor = #colorLiteral(red: 0.231372549, green: 0.231372549, blue: 0.2431372549, alpha: 1)
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.231372549, green: 0.231372549, blue: 0.2431372549, alpha: 1)
        animationView.center = view.center
        animationView.play { finish in
            self.animationView.removeFromSuperview()
            self.bottomViewConfigure()
        }
        
        print("PATH => \(Realm.Configuration.defaultConfiguration.fileURL!)")
    }
    
    private func bottomViewConfigure() {
        
        let exchangeHomeViewController = UINavigationController(rootViewController: ExchangeHomeViewController())
        exchangeHomeViewController.tabBarItem = UITabBarItem(title: "환율", image: UIImage(systemName: "creditcard"), selectedImage: UIImage(systemName: "creditcard.fill"))
        
        let usedListViewController = UINavigationController(rootViewController: UsedListViewController())
        usedListViewController.tabBarItem = UITabBarItem(title: "사용 내역", image: UIImage(systemName: "list.bullet.rectangle.portrait"), selectedImage: UIImage(systemName: "list.bullet.rectangle.portrait.fill"))
        
//        UITabBar.appearance().barTintColor = .orange
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.8228634, green: 0.7475447655, blue: 0.8044595122, alpha: 1)
        
        viewControllers = [ exchangeHomeViewController, usedListViewController ]
    }
}

