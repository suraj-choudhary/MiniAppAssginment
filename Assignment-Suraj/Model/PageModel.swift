//
//  PageModel.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 28/11/23.
//

import Foundation
enum Pages: CaseIterable {
    case pageZero
    case pageOne
    case pageTwo
    case pageThree
    var name: String {
        switch self {
        case .pageZero:
            return "This is page zero"
        case .pageOne:
            return "This is page one"
        case .pageTwo:
            return "This is page two"
        case .pageThree:
            return "This is page three"
        }
    }
    
    var index: Int {
        switch self {
        case .pageZero:
            return 0
        case .pageOne:
            return 1
        case .pageTwo:
            return 2
        case .pageThree:
            return 3
        }
    }
}
