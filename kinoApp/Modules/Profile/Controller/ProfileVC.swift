import UIKit

final class ProfileVC: UIViewController {

    // MARK: - Views
    private let profileHeaderView = ProfileHeaderView()

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let profileInfoView = ProfileInfoView()
    private let paymentInfoView = PaymentInfoView()
    private let companyInfoView = CompanyInfoView()
    private let logoutButtonView = LogoutButtonView()
    

    // MARK: - Life cycle
    var onLogout: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "profileScreen"
        view.backgroundColor = UIColor(named: "Background")
        setupViews()
        setupLayout()
        logoutButtonView.onLogoutTap = { [weak self] in
            self?.onLogout?()
        }
    }

    // MARK: - Setup Views
    private func setupViews() {
        view.addSubview(profileHeaderView)
        view.addSubview(scrollView)

        scrollView.addSubview(contentView)

        [
            profileInfoView,
            paymentInfoView,
            companyInfoView,
            logoutButtonView
        ].forEach {
            contentView.addSubview($0)
        }

        [
            profileHeaderView,
            scrollView,
            contentView,
            profileInfoView,
            paymentInfoView,
            companyInfoView,
            logoutButtonView
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
    }

    // MARK: - Setup Layout
    private func setupLayout() {

        // Header (fixed)
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 50)
        ])

        // ScrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),

            // Prevent horizontal scrolling
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])

        // MARK: - Content Layout
        NSLayoutConstraint.activate([

            profileInfoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            profileInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            profileInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            profileInfoView.heightAnchor.constraint(equalToConstant: 160),

            paymentInfoView.topAnchor.constraint(equalTo: profileInfoView.bottomAnchor, constant: 16),
            paymentInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            paymentInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            paymentInfoView.heightAnchor.constraint(equalToConstant: 200),

            companyInfoView.topAnchor.constraint(equalTo: paymentInfoView.bottomAnchor, constant: 16),
            companyInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            companyInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            companyInfoView.heightAnchor.constraint(equalToConstant: 80),

            logoutButtonView.topAnchor.constraint(equalTo: companyInfoView.bottomAnchor, constant: 24),
            logoutButtonView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            logoutButtonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            logoutButtonView.heightAnchor.constraint(equalToConstant: 60),

            logoutButtonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
