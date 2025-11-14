import UIKit


class ItemRectangleView: UIView {
    var isSelected: Bool = false {
        didSet {
            updateAppearance()
        }
    }
    var textItem: String = "" {
        didSet {
            itemLabel.text = textItem
            
        }
    }
    private let itemLabel: UILabel = {
        var label = UILabel()
        label.textColor = UIColor(.white)
        label.textAlignment = .center
        label.font = UIFont(name: "Urbanist-SemiBold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setSelected(_ selected: Bool) {
        isSelected = selected
    }
    
    private func setupView(){
        backgroundColor = UIColor(named: "Background 2")
        layer.cornerRadius = 18
        isUserInteractionEnabled = true
        addSubview(itemLabel)
        
        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            itemLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            itemLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            itemLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
        ])
    }
    
    private func updateAppearance(){
        if isSelected {
            backgroundColor = UIColor(named: "Imperial red")
            itemLabel.textColor = UIColor(named: "Background")
        } else {
            backgroundColor = UIColor(named: "Background 2")
            itemLabel.textColor = .white
        }
    }
    
}
