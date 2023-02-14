//
//  Dependency_InjectionUITests.swift
//  Dependency-InjectionUITests
//
//  Created by Mac mini on 2023/02/15.
//

import XCTest

//final class Dependency_InjectionUITests: XCTestCase {
//
//
//}

class When_user_fills_correct_credentials_and_press_login_button: XCTestCase {
//final class Dependency_InjectionUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var sth: XCUIApplication!
    
    override class func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        self.app = XCUIApplication()
        self.app.launchEnvironment = ["ENV": "TEST"]
        self.app.launch()
        
        
    }
    
    func test_should_display_lock_successfully() {
        
        let usernameTextField = self.app.textFields["usernameTextField"]
        let passwordTextField = self.app.textFields["passwordTextField"]
        let loginButton = self.app.buttons["loginButton"]
        
        usernameTextField.tap()
        usernameTextField.typeText("johndoe")
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        let imageLock = self.app.images["imageLock"]
        XCTAssertTrue(imageLock.exists)
    }
}
