import UIKit

class ProfileHeaderView: UIView {
    // MARK: - Views
    private let profileHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Профиль"
        label.textColor = UIColor(.white)
        label.font = UIFont(name: "Urbanist-Black", size: 27)
        return label
    }()

    private let profileNotificationButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "gear", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15))
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "Imperial red")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var profileHeaderStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [UIView(), profileHeaderLabel, UIView()])
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    
    // MARK: - SetupView
    private func setupView(){
        addSubview(profileHeaderStack)
        NSLayoutConstraint.activate([
            profileHeaderStack.topAnchor.constraint(equalTo: topAnchor),
            profileHeaderStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileHeaderStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileHeaderLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        addSubview(profileNotificationButton)
        NSLayoutConstraint.activate([
            profileNotificationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileNotificationButton.centerYAnchor.constraint(equalTo: profileHeaderLabel.centerYAnchor),
            profileNotificationButton.heightAnchor.constraint(equalToConstant: 45),
            profileNotificationButton.widthAnchor.constraint(equalToConstant: 45)
            ])
    }
}
