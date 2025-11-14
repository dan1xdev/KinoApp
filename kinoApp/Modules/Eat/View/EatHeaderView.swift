import UIKit

class EatHeaderView: UIView {
    // MARK: - Views
    private let eatHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Еда"
        label.textColor = UIColor(.white)
        label.font = UIFont(name: "Urbanist-Black", size: 27)
        return label
    }()

    private let eatNotificationButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "bell", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var eatHeaderStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [UIView(), eatHeaderLabel, UIView()])
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
        addSubview(eatHeaderStack)
        NSLayoutConstraint.activate([
            eatHeaderStack.topAnchor.constraint(equalTo: topAnchor),
            eatHeaderStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            eatHeaderStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            eatHeaderLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        addSubview(eatNotificationButton)
        NSLayoutConstraint.activate([
            eatNotificationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            eatNotificationButton.centerYAnchor.constraint(equalTo: eatHeaderLabel.centerYAnchor),
            ])
    }
}
