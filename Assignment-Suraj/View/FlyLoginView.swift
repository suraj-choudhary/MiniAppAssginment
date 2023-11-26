//
//  FlyLoginView.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 26/11/23.
//

import UIKit

/// hold the login view
final class FlyLoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemPurple
        addSubViews(containerview)
        constrainscontainerview()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// this anoumus method help to create user intput field for enter the phone number
    private let userPhoneTextField = {
        let phoneTextField = UITextField()
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        return phoneTextField
    }()
    /// this anoumus method help to create user intput field for enter the phone number
    
    private let  stackview = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        return stackview
    }()
    
    
    private let userPasswordTextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
        
    }()
    /// this anoumus method help to create user intput field for enter the phone number
    
    private let containerview = {
        let constainsView = UIView()
        constainsView.translatesAutoresizingMaskIntoConstraints = false
        constainsView.backgroundColor = .gray
        constainsView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        constainsView.layer.cornerRadius = 50
        return constainsView
    }()
    
    
    func constrainscontainerview() {
        NSLayoutConstraint.activate([
            containerview.topAnchor.constraint(equalTo: self.centerYAnchor, constant: -50),
            containerview.leftAnchor.constraint(equalTo: self.leftAnchor),
            containerview.rightAnchor.constraint(equalTo: self.rightAnchor),
            containerview.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    
    
}
