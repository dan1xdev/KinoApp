import UIKit

class AuthVC: UIViewController {

    var onAuthSuccess: (() -> Void)?
    private let authView = AuthView()
    private let authService: AuthService
    init(authService: AuthService) {
        self.authService = authService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        authView.onValidateTap = { [weak self] in
                self?.validateAuth()
        }
        view.backgroundColor = UIColor(named: "Background")
        view.addSubview(authView)
        authView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            authView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            authView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            authView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func validateAuth(){
        authService.login()
        onAuthSuccess?()
    }
}
