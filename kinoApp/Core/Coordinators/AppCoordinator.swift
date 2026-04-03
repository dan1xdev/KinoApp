import UIKit
final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private let authService: AuthService
    
    
    private var childCoordinator: Coordinator?
    
    init(window: UIWindow, authService: AuthService) {
        self.window = window
        self.authService = authService
    }
    
    func start() -> UIViewController{
        let rootVC: UIViewController
        
        if authService.isAuthorized {
            let mainCoordinator = MainCoordinator()
            childCoordinator = mainCoordinator as Coordinator
            rootVC = mainCoordinator.start()
        } else {
            let authCoordinator = AuthCoordinator(authService: authService)
            authCoordinator.onFinish = { [weak self] in
                self?.showMainFlow()
            }
            childCoordinator = authCoordinator as Coordinator
            rootVC = authCoordinator.start()
        }
        
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
        return rootVC
    }
    private func showMainFlow() {
        let mainCoordinator = MainCoordinator()
        mainCoordinator.onLogout = { [weak self] in
            self?.showAuthFlow()
        }
        childCoordinator = mainCoordinator
        window.rootViewController = mainCoordinator.start()
    }
    
    private func showAuthFlow() {
        authService.logout()
        FilmRepository.shared.clearMemoryCache()
        let authCoordinator = AuthCoordinator(authService: authService)
        authCoordinator.onFinish = { [weak self] in
            self?.showMainFlow()
        }
        childCoordinator = authCoordinator
        window.rootViewController = authCoordinator.start()
    }
}
