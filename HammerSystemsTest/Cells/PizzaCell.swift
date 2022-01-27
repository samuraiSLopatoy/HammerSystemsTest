//
//  DishCell.swift
//  HammerSystemsTest
//
//  Created by Михаил Кулагин on 24.01.2022.
//

import UIKit

class PizzaCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "PizzaCell"
    
    let pizzaImageView = UIImageView()
    let nameLabel = UILabel(text: "Name", font: .systemFont(ofSize: 18))
    let taglineLabel = UILabel(text: "Description", font: .systemFont(ofSize: 12))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setupConstraints()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 6
        pizzaImageView.clipsToBounds = true
        pizzaImageView.layer.cornerRadius = 6
        taglineLabel.textColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let pizza: Category = value as? Category else { return }
        pizzaImageView.image = UIImage(named: pizza.imageURL)
        nameLabel.text = pizza.name
        taglineLabel.text = pizza.tagline
    }
    
}

// MARK: - Setup constraints
extension PizzaCell {
    private func setupConstraints() {
        pizzaImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        taglineLabel.translatesAutoresizingMaskIntoConstraints = false
                
        addSubview(pizzaImageView)
        addSubview(nameLabel)
        addSubview(taglineLabel)
        
        NSLayoutConstraint.activate([
            pizzaImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            pizzaImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            pizzaImageView.heightAnchor.constraint(equalToConstant: 78),
            pizzaImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: pizzaImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            taglineLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            taglineLabel.leadingAnchor.constraint(equalTo: pizzaImageView.trailingAnchor, constant: 16),
            taglineLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
        ])
        
    }
    
}
