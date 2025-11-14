//
//  HeaderView.swift
//  kinoApp
//
//  Created by Даниил Кискин on 01.11.2025.
//


import UIKit

final class HeaderView: UIView {
    private let chooseCinemaButton = ChooseCinemaButtonView()
    private let findFilmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = UIColor(.black)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "Imperial red")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "ava"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var rHeaderHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [findFilmButton, profileButton])
        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    private lazy var headerHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [chooseCinemaButton, UIView(), rHeaderHStack])
        stack.axis = .horizontal
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
            addSubview(headerHStack)
            headerHStack.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                headerHStack.topAnchor.constraint(equalTo: topAnchor),
                headerHStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                headerHStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                headerHStack.heightAnchor.constraint(equalToConstant: 50),
                

                
                findFilmButton.widthAnchor.constraint(equalToConstant: 50),
                findFilmButton.heightAnchor.constraint(equalTo: findFilmButton.widthAnchor),
                profileButton.widthAnchor.constraint(equalToConstant: 50),
                profileButton.heightAnchor.constraint(equalTo: profileButton.widthAnchor),
            ])
        }
}
