//
//  CustomTabBarController.swift
//  SpeedTestNew
//
//  Created by Николай Гринько on 11.04.2024.
//

import UIKit


enum Tabs: Int, CaseIterable {
	case overview
	case session
	case progress
	case settings
}
class CustomTabBarController: UITabBarController {
    
    private let customTabBar = CustomTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setValue(customTabBar, forKey: "tabBar")
        setupTabItems()
    }
    
    private func setupTabItems() {
        
		let vc1 = UINavigationController(rootViewController: SessionController())
		let vc2 = UINavigationController(rootViewController: SecondViewController())
		
     // let firstVC = ViewController()
        vc1.tabBarItem.title = "Speed"
        vc1.tabBarItem.image = UIImage(systemName: "timer.circle.fill")
        
        //let secondVC = SecondViewController()
        vc2.tabBarItem.title = "Settings"
        vc2.tabBarItem.image = UIImage(systemName: "gearshape.fill")
        
        setViewControllers([vc1, vc2], animated: true)
    }
	
}



