//
//  FIlmVC.swift
//  kinoApp
//
//  Created by Даниил Кискин on 31.10.2025.
//

import UIKit

class FilmVC: UIViewController {
    let filmNameView = UILabel()
    let filmNameText = "Солнцепек"
    override func viewDidLoad() {
        
        super.viewDidLoad()
        filmNameView.text = filmNameText
        title = "Фильм " + filmNameText
        filmNameView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filmNameView)
        NSLayoutConstraint.activate([
            filmNameView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            filmNameView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
    }
}
