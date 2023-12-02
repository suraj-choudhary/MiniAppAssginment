//
//  SignupView.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 26/11/23.
//

import UIKit
protocol FlySignUpViewProtocol: AnyObject {
    func loginHere(sender: UIButton)
    func navigateToHomeController(sender: UIButton)

}
/// hold the login view
final class FlySignUpView: UIView {
    var flySignUpViewDeleagte: FlySignUpViewProtocol?
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
        label.text = "please enter your email"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    private let passwordTextLabel = {
        let label = UILabel()
        label.text = "please enter your password"
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
    public  var userPhoneTextField = {
        let phoneTextField =  UITextField()
        phoneTextField.backgroundColor = .systemGroupedBackground
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.layer.cornerRadius = 30
        phoneTextField.layer.borderWidth = 1
        phoneTextField.textColor = UIColor.loginBackGroundColor
        phoneTextField.keyboardType = .emailAddress
        phoneTextField.layer.borderColor = UIColor.loginBackGroundColor.cgColor
        phoneTextField.placeholder = "Enter your email"
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
        passwordTextField.placeholder = "Create your password"
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
        button.setTitle("Sign Up", for: .normal)
        button.addTarget(self, action: #selector(signup(sender:)), for: .touchUpInside)

        return button
    }()
    
    
    @objc func signup(sender: UIButton) {
        flySignUpViewDeleagte?.navigateToHomeController(sender: sender)
    }
    
    
    
    
    /// this method used for login
    private let signUpButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        button.setTitleColor(UIColor.loginBackGroundColor, for: .normal)
        button.tintColor = UIColor.loginBackGroundColor
        button.addTarget(self, action: #selector(signupAction(sender:)), for: .touchUpInside)
        button.setTitle("Or Login Here", for: .normal)
        return button
    }()
    
    @objc func signupAction(sender: UIButton) {
        flySignUpViewDeleagte?.loginHere(sender: sender)
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
            userPhoneTextField.leftAnchor.constraint(equalTo: stackview.leftAnchor, constant: 0),
            userPhoneTextField.rightAnchor.constraint(equalTo: stackview.rightAnchor, constant: 0),
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
