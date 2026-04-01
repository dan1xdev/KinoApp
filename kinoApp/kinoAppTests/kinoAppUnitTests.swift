import XCTest
@testable import kinoApp

final class AuthServiceTests: XCTestCase {

    func testLoginSetsAuthorizedTrue() {
        let service = AuthService()

        service.login()

        XCTAssertTrue(service.isAuthorized)
    }

    func testLogoutSetsAuthorizedFalse() {
        let service = AuthService()

        service.login()
        service.logout()

        XCTAssertFalse(service.isAuthorized)
    }
}
