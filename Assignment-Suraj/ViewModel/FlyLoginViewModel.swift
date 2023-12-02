//
//  FlyLoginViewModel.swift
//  Assignment-Suraj
//
//  Created by suraj kumar on 26/11/23.
//

import Foundation

protocol FlyLoginViewModelProtocol: AnyObject {
    func getLoginResut(result: MessageHandler)
}
/// Description
final class FlyLoginViewModel: NSObject {
    var serviceDelegate: ServiceProtocol?
    var flyLoginViewModelProtocol: FlyLoginViewModelProtocol?
    init(serviceDelegate: ServiceProtocol? = ServiceManager()) {
        self.serviceDelegate = serviceDelegate
    }
    
    func loginWithPhone(phone: String) {
        serviceDelegate?.loginWithPhoneNumber(phone: phone, completion: { sucess, res in
            if sucess {
                self.flyLoginViewModelProtocol?.getLoginResut(result: .sucess(res ?? ""))
            } else {
                self.flyLoginViewModelProtocol?.getLoginResut(result: .error(nil))
            }
        })
    }
}
