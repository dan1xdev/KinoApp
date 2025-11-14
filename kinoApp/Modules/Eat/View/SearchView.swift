import UIKit

final class SearchView: UIView {
    
    private lazy var leftSearchButton: UIButton = {
        var button = UIButton()
        let image = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var searchTextField: UITextField = {
        var textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Поиск", attributes: [
            .foregroundColor: UIColor(named: "Background 3")!,
            .font: UIFont(name: "Urbanist-Regular", size: 17)!
        ])
        textField.backgroundColor = .clear
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 21)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var rightMicroButton: UIButton = {
        var button = UIButton()
        let image = UIImage(systemName: "microphone", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22 ,weight: .bold))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var hStackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [leftSearchButton,searchTextField, rightMicroButton])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        return stack
    }()
    
    private let container: UIView = {
        var container = UIView()
        container.backgroundColor = UIColor(named: "Background 2")
        container.layer.cornerRadius = 15
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
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
        addSubview(container)
        container.addSubview(hStackView)
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.heightAnchor.constraint(equalToConstant: 65),
            
            
            hStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12),
            hStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12),
            hStackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
            hStackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -8),
        ])
        
        searchTextField.setContentHuggingPriority(.defaultLow, for: .horizontal)
                leftSearchButton.setContentHuggingPriority(.required, for: .horizontal)
                rightMicroButton.setContentHuggingPriority(.required, for: .horizontal)
    }
}
