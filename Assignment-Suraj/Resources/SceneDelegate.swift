//
//  SceneDelegate.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 26/11/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windoScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windoScene)

         var viewController = UIViewController()
        if ((UserDefaultValue.saveToken?.isEmpty) != nil) {
            let home = FlyTabBarVc()
            home.navigationController?.pushViewController(home, animated: true)
            viewController = FlyTabBarVc()
        } else {
            viewController = FlyLoginVC()
        }
        let loginNav = UINavigationController(rootViewController: viewController)
        window.rootViewController = loginNav
        self.window = window
        window.makeKeyAndVisible()
        
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
       
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
       
    }

    func sceneWillResignActive(_ scene: UIScene) {
       
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }


}

