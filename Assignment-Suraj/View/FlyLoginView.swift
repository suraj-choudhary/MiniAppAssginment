//
//  FlyLoginView.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 26/11/23.
//

import UIKit

protocol FlyLoginViewProtocol: AnyObject {
    func singUpHere(sender: UIButton)
    func navigateToHomeController()
}

/// hold the login view
final class FlyLoginView: UIView {
    var flyLoginViewDelagte: FlyLoginViewProtocol?
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.loginBackGroundColor1
        addSubview(stackview)
        constrainscontainerview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private let emailTextTitleLbl = {
        let label =  UILabel()
        label.text = "Email"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    private let passwordTextLabel = {
        let label = UILabel()
        label.text = "password"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    
    /// this method used for login
    private let termAndConidtionBtn = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        button.setTitleColor(UIColor.loginBackGroundColor, for: .normal)
        button.setTitle("•Term & Conditions Apply•", for: .normal)
        return button
    }()
    /// this anoumus method help to create user intput field for enter the phone number
    
    public lazy var stackview = {
        let stackview = UIStackView(arrangedSubviews: [
            emailTextTitleLbl,
            userPhoneTextField,
            passwordTextLabel,
            userPasswordTextField,
            loginButton,
            signUpButton,
            termAndConidtionBtn
        ])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.distribution = .fillProportionally
        
        stackview.axis = .vertical
        stackview.spacing = 10
        return stackview
    }()
    
    
    /// this anoumus method help to create user intput field for enter the phone number
    private  var userPhoneTextField = {
        let phoneTextField =  UITextField()
        phoneTextField.backgroundColor = .systemGroupedBackground
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.layer.cornerRadius = 30
        phoneTextField.layer.borderWidth = 1
        phoneTextField.textColor = UIColor.loginBackGroundColor
        phoneTextField.keyboardType = .emailAddress
        phoneTextField.layer.borderColor = UIColor.loginBackGroundColor.cgColor
        phoneTextField.placeholder = "Enter Email"
        phoneTextField.leftViewMode = .always
        phoneTextField.leftView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: 0))
        phoneTextField.font = .systemFont(ofSize: 20, weight: .medium)
        return phoneTextField
    }()
    
    private  var userPasswordTextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = .systemGroupedBackground
        passwordTextField.layer.cornerRadius = 30
        passwordTextField.layer.borderWidth = 1
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textColor = UIColor.loginBackGroundColor
        passwordTextField.layer.borderColor = UIColor.loginBackGroundColor.cgColor
        passwordTextField.font = .systemFont(ofSize: 20, weight: .medium)
        passwordTextField.placeholder = "Enter password"
        passwordTextField.leftViewMode = .always
        passwordTextField.leftView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: 0))
        return passwordTextField
        
    }()
    
    
    /// this method used for login
    private let loginButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.loginBackGroundColor
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(loginAction(sender:)), for: .touchUpInside)

        button.setTitle("Login", for: .normal)
        return button
    }()
    
    
    /// Description
    /// - Parameter sender: sender description
    @objc func loginAction(sender: UIButton) {
        flyLoginViewDelagte?.navigateToHomeController()
    }
    
    
    
    
    /// this method used for login
    private let signUpButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        button.setTitleColor(UIColor.loginBackGroundColor, for: .normal)
        button.tintColor = UIColor.loginBackGroundColor
        button.addTarget(self, action: #selector(signupAction(sender:)), for: .touchUpInside)
        button.setTitle("Or sign up here", for: .normal)
        return button
    }()
    
    @objc func signupAction(sender: UIButton) {
        flyLoginViewDelagte?.singUpHere(sender: sender)
    }
    
    
    
    func constrainscontainerview() {
        NSLayoutConstraint.activate([
            
            //stack view
            stackview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            stackview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            ///
            userPhoneTextField.heightAnchor.constraint(equalToConstant: 60),
            
            userPasswordTextField.heightAnchor.constraint(equalToConstant: 60),
            ///
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            
            loginButton.topAnchor.constraint(equalTo: userPasswordTextField.bottomAnchor, constant: 100),
            loginButton.leftAnchor.constraint(equalTo: stackview.leftAnchor, constant: 70),
            loginButton.rightAnchor.constraint(equalTo: stackview.rightAnchor, constant: -70),
            ///
            emailTextTitleLbl.heightAnchor.constraint(equalToConstant: 15),
            passwordTextLabel.heightAnchor.constraint(equalToConstant: 15),
            
            ///
        
            
            signUpButton.heightAnchor.constraint(equalToConstant: 60),
            
            termAndConidtionBtn.heightAnchor.constraint(equalToConstant: 60),
            
            termAndConidtionBtn.leftAnchor.constraint(equalTo: stackview.leftAnchor, constant: 70),
            termAndConidtionBtn.rightAnchor.constraint(equalTo: stackview.rightAnchor, constant: -70),
            
            termAndConidtionBtn.bottomAnchor.constraint(equalTo: stackview.bottomAnchor, constant: 10)
        ])
    }
}
