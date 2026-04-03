import UIKit

final class AuthView: UIView {

    var onValidateTap: (() -> Void)?

    // MARK: - Logo / Title

    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "film.stack")
        iv.tintColor = UIColor(named: "Imperial red")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "КиноАпп"
        label.font = UIFont(name: "Urbanist-Black", size: 32) ?? UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Войдите, чтобы продолжить"
        label.font = UIFont(name: "Urbanist-Medium", size: 15) ?? UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.white.withAlphaComponent(0.5)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Fields

    private let loginField: UITextField = {
        let tf = UITextField()
        tf.accessibilityIdentifier = "loginTf"
        tf.backgroundColor = UIColor(named: "Background 2")
        tf.layer.cornerRadius = 15
        tf.textColor = .white
        tf.font = UIFont(name: "Urbanist-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16)
        tf.tintColor = UIColor(named: "Imperial red")
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.textContentType = .oneTimeCode

        let icon = UIImageView(image: UIImage(systemName: "person"))
        icon.tintColor = UIColor.white.withAlphaComponent(0.4)
        icon.frame = CGRect(x: 12, y: 0, width: 22, height: 44)
        icon.contentMode = .scaleAspectFit
        let iconContainer = UIView(frame: CGRect(x: 0, y: 0, width: 48, height: 44))
        iconContainer.addSubview(icon)
        tf.leftView = iconContainer
        tf.leftViewMode = .always

        tf.attributedPlaceholder = NSAttributedString(
            string: "Логин",
            attributes: [
                .foregroundColor: UIColor.white.withAlphaComponent(0.35),
                .font: UIFont(name: "Urbanist-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16)
            ]
        )
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let passwordField: UITextField = {
        let tf = UITextField()
        tf.accessibilityIdentifier = "passwTf"
        tf.backgroundColor = UIColor(named: "Background 2")
        tf.layer.cornerRadius = 15
        tf.textColor = .white
        tf.font = UIFont(name: "Urbanist-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16)
        tf.tintColor = UIColor(named: "Imperial red")
        tf.isSecureTextEntry = true
        tf.autocapitalizationType = .none
        tf.textContentType = .oneTimeCode

        let icon = UIImageView(image: UIImage(systemName: "lock"))
        icon.tintColor = UIColor.white.withAlphaComponent(0.4)
        icon.frame = CGRect(x: 12, y: 0, width: 22, height: 44)
        icon.contentMode = .scaleAspectFit
        let iconContainer = UIView(frame: CGRect(x: 0, y: 0, width: 48, height: 44))
        iconContainer.addSubview(icon)
        tf.leftView = iconContainer
        tf.leftViewMode = .always

        tf.attributedPlaceholder = NSAttributedString(
            string: "Пароль",
            attributes: [
                .foregroundColor: UIColor.white.withAlphaComponent(0.35),
                .font: UIFont(name: "Urbanist-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16)
            ]
        )
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    // MARK: - Button

    private lazy var loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.accessibilityIdentifier = "loginBtn"
        btn.setTitle("Войти", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Urbanist-SemiBold", size: 17) ?? UIFont.boldSystemFont(ofSize: 17)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = UIColor(named: "Imperial red")
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(validateTapped), for: .touchUpInside)
        return btn
    }()

    // MARK: - Stack

    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [loginField, passwordField, loginButton])
        stack.axis = .vertical
        stack.spacing = 12
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

    // MARK: - Setup

    private func setupView() {
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(vStack)

        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -12),
            logoImageView.widthAnchor.constraint(equalToConstant: 64),
            logoImageView.heightAnchor.constraint(equalToConstant: 64),

            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -6),

            subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: vStack.topAnchor, constant: -32),

            vStack.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 40),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),

            loginField.heightAnchor.constraint(equalToConstant: 56),
            passwordField.heightAnchor.constraint(equalToConstant: 56),
            loginButton.heightAnchor.constraint(equalToConstant: 56),
        ])
    }

    // MARK: - Actions

    @objc private func validateTapped() {
        onValidateTap?()
    }
}
