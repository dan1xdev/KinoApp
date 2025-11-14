import UIKit

final class LoyaltyView: UIView{
    
    private let rectangleContainer: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 10
        container.backgroundColor = UIColor(named: "Background 2")

        return container
    }()
    
    private let loyaltyText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        let fullText = "Списывайте и получайте бонусы за просмотр кино"
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // Делаем первую половину текста жирной
        let boldRange = NSRange(location: 0, length: fullText.count / 2)
        let boldFont = UIFont(name: "Urbanist-Black", size: 20) ?? UIFont.boldSystemFont(ofSize: 20)
        attributedString.addAttribute(.font, value: boldFont, range: boldRange)
        
        // Остальной текст обычный
        let normalRange = NSRange(location: fullText.count / 2, length: fullText.count - fullText.count / 2)
        let normalFont = UIFont(name: "Urbanist-Medium", size: 20) ?? UIFont.systemFont(ofSize: 20)
        attributedString.addAttribute(.font, value: normalFont, range: normalRange)
        
        label.attributedText = attributedString
        label.textColor = UIColor(.white)
        
        return label
    }()

    private let loyaltyQR: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "qr")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var hStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [loyaltyText, loyaltyQR])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 40
        return stack
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(){
        addSubview(rectangleContainer)
        rectangleContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rectangleContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            rectangleContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            rectangleContainer.topAnchor.constraint(equalTo: topAnchor),
            rectangleContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
        
        rectangleContainer.addSubview(hStack)
        hStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: rectangleContainer.leadingAnchor, constant: 16),
            hStack.trailingAnchor.constraint(equalTo: rectangleContainer.trailingAnchor, constant: -16),
            hStack.bottomAnchor.constraint(equalTo: rectangleContainer.bottomAnchor, constant: -16),
            hStack.topAnchor.constraint(equalTo: rectangleContainer.topAnchor)
        ])
        loyaltyQR.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loyaltyQR.heightAnchor.constraint(equalTo: loyaltyQR.widthAnchor).isActive = true
        
        
    
    }
    
}
