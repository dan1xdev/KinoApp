import UIKit

final class MainCoordinator: Coordinator{
    var onLogout: (() -> Void)?

    deinit {
        print("❌ MainCoordinator deinit")
    }
    func start() -> UIViewController
    {
        let tabBar = TabController()
        let mainNav = makeMainTab()
        let eatNav = makeEatTab()
        let profileNav = makeProfileTab()
        
        tabBar.configure(with: [
                    mainNav,
                    eatNav,
                    profileNav
                ])

        return tabBar
    }
    
    private func makeMainTab() -> UINavigationController {
            let vc = MainPageVC()
            let nav = UINavigationController(rootViewController: vc)
            nav.tabBarItem.image = UIImage(named: "Billboard")
            return nav
        }

        private func makeEatTab() -> UINavigationController {
            let vc = EatVC()
            let nav = UINavigationController(rootViewController: vc)
            nav.tabBarItem.image = UIImage(named: "Food")
            return nav
        }

        private func makeProfileTab() -> UINavigationController {
            let vc = ProfileVC()
            vc.onLogout = { [weak self] in
                self?.onLogout?()
            }
            let nav = UINavigationController(rootViewController: vc)
            nav.tabBarItem.image = UIImage(named: "Profile")
            return nav
        }
}
