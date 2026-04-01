import UIKit

final class AuthCoordinator: Coordinator{
    let authService: AuthService
    var onFinish: (() -> Void)?
    func start() -> UIViewController
    {
        let authVC = AuthVC(authService: authService)
        authVC.onAuthSuccess = { [weak self] in
            self?.onFinish?()
        }
        return authVC
    }
    init(authService: AuthService) {
        self.authService = authService
    }
}
