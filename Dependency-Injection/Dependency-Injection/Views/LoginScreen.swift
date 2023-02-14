//
//  LoginScreen.swift
//  Dependency-Injection
//
//  Created by Mac mini on 2023/02/15.
//

import SwiftUI

struct LoginScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @StateObject var loginVM: LoginViewModel
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Username", text: $username)
                    .accessibilityIdentifier("usernameTextField")
                TextField("Password", text: $password)
                    .accessibilityIdentifier("passwordTextField")
                HStack {
                    Spacer()
                    Button("Login") {
                        // perform login
                        loginVM.login(username, password)
                    }.accessibilityIdentifier("loginButton")
                    Spacer()
                }
                
                if loginVM.isAuthenticated {
                    Image(systemName: "lock")
                        .accessibilityIdentifier("imageLock")
                }
            }
            .navigationTitle("Login")
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        return LoginScreen(loginVM: LoginViewModel(service: PetAdoptionService()))
    }
}
