//
//  LogoutButtonView.swift
//  kinoApp
//
//  Created by Даниил Кискин on 07.11.2025.
//

import UIKit

final class LogoutButtonView: UIView {
    // MARK: - Views
    private let container: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 15
        v.backgroundColor = UIColor(named: "Imperial red")
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isUserInteractionEnabled = true
        return v
    }()
    private let logoutImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "rectangle.portrait.and.arrow.right", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let logoutLabel: UILabel = {
        let label = UILabel()
        label.text = "Выйти"
        label.textAlignment = .center
        label.font = UIFont(name: "Urbanist-SemiBold", size: 17)
        label.textColor = .black
        return label
    }()
    
    private lazy var HStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [logoutImage, logoutLabel, UIView()])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
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
    
    func setupView(){
        addSubview(container)
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        container.addSubview(HStackView)
        NSLayoutConstraint.activate([
            HStackView.topAnchor.constraint(equalTo: container.topAnchor),
            HStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8),
            HStackView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            HStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -8),
        ])
        
    }
}
