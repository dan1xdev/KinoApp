//
//  ProfileInfoView.swift
//  kinoApp
//
//  Created by Даниил Кискин on 07.11.2025.
//

import UIKit

class ProfileInfoView: UIView {
    
    // MARK: - UI Elements
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ava")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        
        let fullText = "Привет! Даниил\nДобро пожаловать!"
        
        // Создаём атрибутированную строку
        let attributedText = NSMutableAttributedString(
            string: fullText,
            attributes: [
                .font: UIFont(name: "Urbanist-Medium", size: 20)!,
                .foregroundColor: UIColor.white
            ]
        )
        
        // Находим диапазон текста после \n
        if let range = fullText.range(of: "Добро пожаловать!") {
            let nsRange = NSRange(range, in: fullText)
            attributedText.addAttributes([
                .font: UIFont(name: "Urbanist-ExtraBold", size: 26)!,
                .foregroundColor: UIColor.white
            ], range: nsRange)
        }
        
        label.attributedText = attributedText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var profileHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [containerView, welcomeLabel])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        stack.alignment = .center
        return stack
    }()
    
    // MARK: - Inits
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
        // Добавляем изображение в контейнер
        containerView.addSubview(profileImageView)
        
        // Добавляем stack на view
        addSubview(profileHStack)
        
        NSLayoutConstraint.activate([
            // Stack view constraints
            profileHStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileHStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            profileHStack.topAnchor.constraint(equalTo: topAnchor),
            profileHStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // Container constraints
            containerView.widthAnchor.constraint(equalToConstant: 120),
            containerView.heightAnchor.constraint(equalToConstant: 120),
            
            // Image view constraints (заполняет весь контейнер)
            profileImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            profileImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
