//
//  Dependency_InjectionApp.swift
//  Dependency-Injection
//
//  Created by Mac mini on 2023/02/15.
//

import SwiftUI

@main
struct Dependency_InjectionApp: App {
    var body: some Scene {
        WindowGroup {
            //            let loginVM = LoginViewModel(service: PetAdoptionService())
            //            LoginScreen(loginVM: loginVM)
            
            let webserviceFactory = WebserviceFactory()
            LoginScreen(loginVM: LoginViewModel(service: webserviceFactory.create()))
        }
    }
}
