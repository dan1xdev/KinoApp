import XCTest
@testable import kinoApp


final class AuthFlowUITests: XCTestCase {
    let app = XCUIApplication()
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        addUIInterruptionMonitor(withDescription: "System Dialog") { alert in
                if alert.buttons["Не сейчас"].exists {
                    alert.buttons["Не сейчас"].tap()
                    return true
                }
                if alert.buttons["Not Now"].exists {
                    alert.buttons["Not Now"].tap()
                    return true
                }
                return false
            }
        
        app.launch()
        XCUIDevice.shared.orientation = .portrait
    }
    func testAuthFlow(){
        login()
        goToProfile()
        logout()
    }
    private func login(){
        let loginField = app.textFields["loginTf"]
        let passwordField = app.secureTextFields["passwTf"]
        let loginButton = app.buttons["loginBtn"]
        loginField.tap()
        loginField.typeText("123")

        passwordField.tap()
        passwordField.typeText("123")

        loginButton.tap()

        let mainScreen = app.otherElements["mainScreen"]
        XCTAssertTrue(mainScreen.waitForExistence(timeout: 15))

    }
    
    private func goToProfile() {
        let profileTab = app.tabBars.buttons["tabProfile"]
        

        XCTAssertTrue(profileTab.waitForExistence(timeout: 5))
        profileTab.tap()

        let logoutButton = app.buttons["profileLogout"]
        XCTAssertTrue(logoutButton.waitForExistence(timeout: 5))
    }
    
    private func logout() {
        let logoutButton = app.buttons["profileLogout"]

        XCTAssertTrue(logoutButton.waitForExistence(timeout: 5))
        logoutButton.tap()

        let loginButton = app.buttons["loginBtn"]
        XCTAssertTrue(loginButton.waitForExistence(timeout: 5))
    }
}


