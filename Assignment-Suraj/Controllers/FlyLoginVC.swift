//
//  ViewController.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 26/11/23.
//

import UIKit
/// Help to hold the login for fly app
class FlyLoginVC: UIViewController, FlyLoginViewProtocol, FlySignUpViewProtocol, FlyLoginViewModelProtocol {
    func navigateToHomeController() {
        
    }
    var flyLoginView = FlyLoginView()
    var signupView =  FlySignUpView()
    
    lazy var viewModel = {
        FlyLoginViewModel()
    }()
    
    /// life cycle of viewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        flyLoginView.flyLoginViewDelagte = self
        signupView.flySignUpViewDeleagte = self
        view.backgroundColor = .loginBackGroundColor
        view.addSubview(containerview)
        containerview.addSubview(flyLoginView)
        containerview.addSubview(signupView)
        containerview.addSubview(signUpSegmentControl)
        signupView.isHidden = true
        addConstrainst()
        viewModel.flyLoginViewModelProtocol = self
    }
    private let titleLable = {
        let label = UILabel()
        label.text = "Hey!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomTitleLable = {
        let label = UILabel()
        label.text = "Welcome Back!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let containerview = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.loginBackGroundColor1
        view.layer.masksToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 50
        return view
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    /// constrains for view
    func addConstrainst() {
        NSLayoutConstraint.activate([
            containerview.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerview.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            containerview.heightAnchor.constraint(equalToConstant: view.frame.height / 2 + 100),
            
            containerview.bottomAnchor.constraint(equalTo:view.bottomAnchor),
            
            
            signUpSegmentControl.topAnchor.constraint(equalTo: containerview.topAnchor, constant: 20),
            signUpSegmentControl.leftAnchor.constraint(equalTo: containerview.leftAnchor, constant: 10),
            signUpSegmentControl.rightAnchor.constraint(equalTo: containerview.rightAnchor, constant: -10),
            signUpSegmentControl.heightAnchor.constraint(equalToConstant: 44),
            
            flyLoginView.leftAnchor.constraint(equalTo: containerview.leftAnchor, constant: 0),
            flyLoginView.rightAnchor.constraint(equalTo: containerview.rightAnchor, constant: 0),
            
            flyLoginView.topAnchor.constraint(equalTo: signUpSegmentControl.bottomAnchor, constant: 20),
            
            signupView.leftAnchor.constraint(equalTo: containerview.leftAnchor, constant: 0),
            signupView.rightAnchor.constraint(equalTo: containerview.rightAnchor, constant: 0),
            
            signupView.topAnchor.constraint(equalTo: signUpSegmentControl.bottomAnchor, constant: 20),
            
            
        ])
    }
    /// Description
    private let signUpSegmentControl: UISegmentedControl = {
        let items = ["Login", "Sign up"]
        
        let segmentControl = UISegmentedControl(items: items)
        
        segmentControl.addTarget(self, action: #selector(segmentAction(sender:)), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
        
        segmentControl.backgroundColor = UIColor.loginBackGroundColor1
        segmentControl.tintColor = .red
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentControl
    }()
    
    
    /// Description
    /// - Parameter sender: sender description
    @objc func segmentAction(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.flyLoginView.isHidden = false
            self.signupView.isHidden = true
            
        case 1:
            DispatchQueue.main.async {
                self.flyLoginView.isHidden = true
                self.signupView.isHidden = false
                
            }
        default:
            break
        }
    }
    
    /// Description
    /// - Parameter sender: sender description
    func singUpHere(sender: UIButton) {
        flyLoginView.isHidden = true
        signupView.isHidden = false
        signUpSegmentControl.selectedSegmentIndex = 1
    }
    /// Description
    /// - Parameter sender: sender description
    func loginHere(sender: UIButton) {
        signupView.isHidden = true
        flyLoginView.isHidden = false
        signUpSegmentControl.selectedSegmentIndex = 0
    }
    /// Description
    func navigateToHomeController(sender: UIButton) {
        
        guard let text = signupView.userPhoneTextField.text else {
            return
        }
        viewModel.loginWithPhone(phone: text)
    }
    /// Description
    /// - Parameter result: result description
    func getLoginResut(result: MessageHandler) {
        switch result {
        case .sucess(let token):
            UserDefaultValue.saveToken = token
            let home = FlyTabBarVc()
            navigationController?.pushViewController(home, animated: true)
        case .error(let error):
            debugPrint(error)
        }
    }
    
}

