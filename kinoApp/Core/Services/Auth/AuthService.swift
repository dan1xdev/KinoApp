final class AuthService {

    private(set) var isAuthorized: Bool = false

    func login() {
        isAuthorized = true
    }

    func logout() {
        isAuthorized = false
    }
}
