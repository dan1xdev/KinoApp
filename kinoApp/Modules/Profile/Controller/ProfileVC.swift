import UIKit

final class ProfileVC: UIViewController {
    
    // MARK: - Views
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let profileHeaderView = ProfileHeaderView()
    let profileInfoView =  ProfileInfoView()
    let paymentInfoView = PaymentInfoView()
    let companyInfoView = CompanyInfoView()
    let logoutButtonView = LogoutButtonView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        setupViews()
        setupLayout()
    }
    
    private func setupViews() {
        // 1. scrollView на главный view
        view.addSubview(profileHeaderView)
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        // 2. contentView внутрь scrollView
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        // 3. все остальные — в contentView
        [
         profileInfoView,
         paymentInfoView,
         companyInfoView,
         logoutButtonView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 50),
            
            
            
            // scrollView занимает весь экран
            scrollView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            // contentView привязываем к contentLayoutGuide
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            // ширина contentView = ширине scrollView (чтобы не было горизонтального скролла)
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
        ])

        // Констрейнты внутренних вью — уже к contentView
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 50),
            
            profileInfoView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor, constant: 10),
            profileInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            profileInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            profileInfoView.heightAnchor.constraint(equalToConstant: 160),
            
            paymentInfoView.topAnchor.constraint(equalTo: profileInfoView.bottomAnchor, constant: 10),
            paymentInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            paymentInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            paymentInfoView.heightAnchor.constraint(equalToConstant: 200),
            
            companyInfoView.topAnchor.constraint(equalTo: paymentInfoView.bottomAnchor, constant: 10),
            companyInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            companyInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            companyInfoView.heightAnchor.constraint(equalToConstant: 80),
            
            // ВАЖНО: bottomAnchor к contentView.bottomAnchor,
            // чтобы scrollView понимал высоту контента
            logoutButtonView.topAnchor.constraint(equalTo: companyInfoView.bottomAnchor, constant: 20),
            logoutButtonView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            logoutButtonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            logoutButtonView.heightAnchor.constraint(equalToConstant: 60),
            logoutButtonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
}
