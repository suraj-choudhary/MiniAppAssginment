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
    static let color = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1)
}
