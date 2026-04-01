import UIKit


final class TabController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("TabController willAppear")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        view.backgroundColor = UIColor(named: "Background")
    }
    func configure(with navs: [UINavigationController]) {
        setViewControllers(navs, animated: false)
    }

    private func setupAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black // или systemBackground

        let itemAppearance = UITabBarItemAppearance()

        itemAppearance.normal.iconColor = .white
        itemAppearance.selected.iconColor = UIColor(named: "Imperial red")

        itemAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        itemAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor(named: "Imperial red") ?? UIColor.systemRed
        ]

        appearance.stackedLayoutAppearance = itemAppearance
        appearance.inlineLayoutAppearance = itemAppearance
        appearance.compactInlineLayoutAppearance = itemAppearance

        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}
