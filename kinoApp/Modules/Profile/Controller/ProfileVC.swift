import UIKit

final class ProfileVC: UIViewController {
    
    // MARK: - Initialize Views
    let profileHeaderView = ProfileHeaderView()
    let profileInfoView =  ProfileInfoView()
    let paymentInfoView = PaymentInfoView()
    let companyInfoView = CompanyInfoView()
    let logoutButtonView = LogoutButtonView()
    
    // MARK: - Load
    override func viewDidLoad(){
        // setup
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        setupViews()
        setupLayout()
    }
    
    private func setupViews(){
        view.addSubview(profileHeaderView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileInfoView)
        profileInfoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(paymentInfoView)
        paymentInfoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(companyInfoView)
        companyInfoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButtonView)
        logoutButtonView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant:50),
            
            profileInfoView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor, constant: 10),
            profileInfoView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 20),
            profileInfoView.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -20),
            profileInfoView.heightAnchor.constraint(equalToConstant: 200),
            
            
            paymentInfoView.topAnchor.constraint(equalTo: profileInfoView.bottomAnchor, constant: 10),
            paymentInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            paymentInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            paymentInfoView.heightAnchor.constraint(equalToConstant: 200),
            
            
            companyInfoView.topAnchor.constraint(equalTo: paymentInfoView.bottomAnchor, constant: 10),
            companyInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            companyInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            companyInfoView.heightAnchor.constraint(equalToConstant: 80),
            
            logoutButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            logoutButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            logoutButtonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            logoutButtonView.heightAnchor.constraint(equalToConstant: 60)
            ])
        
        
            
        
        
        
    }

}
