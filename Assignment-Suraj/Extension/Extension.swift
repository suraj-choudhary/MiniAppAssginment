//
//  Extension.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 26/11/23.
//
import UIKit
///This method help to add multiple views
extension UIView {
    func addSubViews(_ view: UIView...) {
        view.forEach({
            addSubview($0)
        })
    }
}
extension UIColor {
    static let loginBackGroundColor = UIColor(red: 91 / 255, green: 47 / 255, blue: 37 / 255, alpha: 1)
    static let loginBackGroundColor1 = UIColor(red: 242 / 255, green: 226 / 255, blue: 226 / 255, alpha: 1)
}

struct UserDefaultValue {
    static let token = "tokenID"
    
    static var saveToken: String? {
        get {
            return UserDefaults.standard.string(forKey: token)
        } set {
            return UserDefaults.standard.set(newValue, forKey: token)
            
        }
    }
}

extension UIViewController {
    func showPicker() {
        let alertController = UIAlertController(title: "Enter Text", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Your Placeholder Text"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] (_) in
            if let text = alertController.textFields?.first?.text {
                print("Entered Text: \(text)")
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
