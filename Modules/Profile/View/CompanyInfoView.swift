//
//  CompanyInfoView.swift
//  kinoApp
//
//  Created by Даниил Кискин on 07.11.2025.
//

import UIKit

class CompanyInfoView: UIView{
    // MARK: - Views
    let aboutUsButton = CompanyButtonView()
    let contactUsButton = CompanyButtonView()
    
    private lazy var VStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [aboutUsButton, contactUsButton])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
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
    
    private func configureButtons(){
        aboutUsButton.createInfoButtonView(image: UIImage(systemName: "pencil.line")!, text: "О нас")
        contactUsButton.createInfoButtonView(image: UIImage(systemName: "questionmark.circle.fill")!, text: "Связаться с нами")
    }
    
    // MARK: - Setup
    private func setupView(){
        configureButtons()
        addSubview(VStackView)
        NSLayoutConstraint.activate([
            VStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            VStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            VStackView.topAnchor.constraint(equalTo: topAnchor),
            VStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
