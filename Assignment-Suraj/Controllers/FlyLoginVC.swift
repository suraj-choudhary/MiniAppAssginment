//
//  ViewController.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 26/11/23.
//

import UIKit
/// Help to hold the login for fly app
class FlyLoginVC: UIViewController {
    
    var flyLoginView = FlyLoginView()
    
    /// life cycle of viewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(flyLoginView)
        addConstrainst()
    }
    
    
    /// constrains for view
    func addConstrainst() {
        NSLayoutConstraint.activate([
            flyLoginView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            flyLoginView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            flyLoginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            flyLoginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    
    
}

