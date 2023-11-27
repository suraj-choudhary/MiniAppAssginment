//
//  FlyTabBarVc.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 26/11/23.
//

import UIKit

class FlyTabBarVc: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
    
    func setupTabBar() {
        let flyHomeVc = UINavigationController(rootViewController: FlyHomeVc())
        flyHomeVc.tabBarItem = UITabBarItem(title: "Create",
                                       image: UIImage(systemName: "plus.circle"),
                                       tag: 0)
        

        setViewControllers([flyHomeVc], animated: true)
    }

}
