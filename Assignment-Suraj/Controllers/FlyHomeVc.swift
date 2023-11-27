//
//  FlyHomeVc.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 26/11/23.
//

import UIKit

/// Home
class FlyHomeVc: UIViewController {

    var homeView = HomeView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeView)
        setUpView()
    }
    
    
    /// Description
    private func setUpView() {
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            homeView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
}
