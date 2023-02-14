//
//  Webservice.swift
//  Dependency-Injection
//
//  Created by Mac mini on 2023/02/15.
//

import Foundation

protocol Webservice {
    func authenticate(_ username: String, _ password: String) -> Bool
}

class PetAdoptionService: Webservice {
    func authenticate(_ username: String, _ password: String) -> Bool {
        sleep(5)
        return true
    }
}

class FakeAuthService: Webservice {
    func authenticate(_ username: String, _ password: String) -> Bool {
        print("FakeAuthService")
        return true
    }
}
