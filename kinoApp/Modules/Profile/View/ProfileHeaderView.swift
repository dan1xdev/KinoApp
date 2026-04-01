import UIKit

final class ProfileHeaderView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Профиль"
        label.textColor = .white
        label.font = UIFont(name: "Urbanist-Black", size: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(
            systemName: "gear",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 15)
        )
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.backgroundColor = UIColor(named: "Imperial red")
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(titleLabel)
        addSubview(settingsButton)

        NSLayoutConstraint.activate([
            // Header height
            heightAnchor.constraint(equalToConstant: 50),

            // Title centered
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            // Settings button
            settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            settingsButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            settingsButton.heightAnchor.constraint(equalToConstant: 45),
            settingsButton.widthAnchor.constraint(equalToConstant: 45)
        ])
    }
}
