import UIKit

final class LoyaltyView: UIView {

    private let rectangleContainer: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 10
        v.backgroundColor = UIColor(named: "Background 2")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let loyaltyText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white

        let fullText = "Списывайте и получайте бонусы за просмотр кино"
        let attributed = NSMutableAttributedString(string: fullText)

        let boldFont = UIFont(name: "Urbanist-Black", size: 20) ?? .boldSystemFont(ofSize: 20)
        let normalFont = UIFont(name: "Urbanist-Medium", size: 20) ?? .systemFont(ofSize: 20)

        let mid = fullText.count / 2
        attributed.addAttribute(.font, value: boldFont, range: NSRange(location: 0, length: mid))
        attributed.addAttribute(.font, value: normalFont, range: NSRange(location: mid, length: fullText.count - mid))

        label.attributedText = attributed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let loyaltyQR: UIImageView = {
        let image = UIImageView(image: UIImage(named: "qr"))
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var hStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [loyaltyText, loyaltyQR])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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

        addSubview(rectangleContainer)
        rectangleContainer.addSubview(hStack)

        NSLayoutConstraint.activate([
            rectangleContainer.topAnchor.constraint(equalTo: topAnchor),
            rectangleContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            rectangleContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            rectangleContainer.bottomAnchor.constraint(equalTo: bottomAnchor),

            hStack.topAnchor.constraint(equalTo: rectangleContainer.topAnchor, constant: 12),
            hStack.leadingAnchor.constraint(equalTo: rectangleContainer.leadingAnchor, constant: 16),
            hStack.trailingAnchor.constraint(equalTo: rectangleContainer.trailingAnchor, constant: -16),
            hStack.bottomAnchor.constraint(equalTo: rectangleContainer.bottomAnchor, constant: -12),

            loyaltyQR.widthAnchor.constraint(equalToConstant: 100),
            loyaltyQR.heightAnchor.constraint(equalTo: loyaltyQR.widthAnchor)
        ])
    }
}
