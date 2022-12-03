//
//  MainTabBarController.swift
//  Sport_App
//
//  Created by Дмитрий Шмаков on 01.12.2022.
//

import UIKit


class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupViews()
    }
    private func setupTabBar() {
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialDarkGreen
        tabBar.unselectedItemTintColor = .specialGray
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.specialLightBrown.cgColor
    }
    
    private func setupViews() {
        let mainVC = MainViewController()
        let statisticVC = StatisticsViewController()
    
     setViewControllers([mainVC, statisticVC], animated: true)
        
        
        guard let items = tabBar.items else {return}
        
        items[0].title = "Main"
        items[1].title = "Statistic"
        
        items[0].image = UIImage(named: "mainTanbBar")
        items[1].image = UIImage(named: "statistic")
        
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont(name: "Roboto-Bold", size: 12) as Any], for: .normal)
        
    }
    }
    
    
    

