//
//  FlyTabBarVc.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 26/11/23.
//

import UIKit

class FlyTabBarVc: UITabBarController, UITabBarControllerDelegate {
    let homeVC = FlyHomeVc()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBar()
    }
    
    
    func setupTabBar() {
        let flyHomeVc = UINavigationController(rootViewController: homeVC)
        
        flyHomeVc.tabBarItem = UITabBarItem(title: "Create",
                                            image: UIImage(systemName: "plus.circle"),
                                            tag: 0)
        
        
        setViewControllers([flyHomeVc], animated: true)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let imagePicker = homeVC.imagePicker
        present(imagePicker, animated: true, completion: nil)
        return true;
    }
    
}
