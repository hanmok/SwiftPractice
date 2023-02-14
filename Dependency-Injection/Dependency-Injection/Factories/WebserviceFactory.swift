//
//  WebserviceFactory.swift
//  Dependency-Injection
//
//  Created by Mac mini on 2023/02/15.
//

import Foundation

class WebserviceFactory {
    func create() -> Webservice {
        let environment = ProcessInfo.processInfo.environment["ENV"]
        if environment == "TEST" {
            return FakeAuthService()
        } else {
            return PetAdoptionService()
        }
    }
}
