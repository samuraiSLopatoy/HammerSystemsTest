//
//  DrinkCell.swift
//  HammerSystemsTest
//
//  Created by Михаил Кулагин on 25.01.2022.
//

import UIKit

class DrinkCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "DrinkCell"
    
    let drinkImageView = UIImageView()
    let nameLabel = UILabel(text: "Name", font: .systemFont(ofSize: 18))
    let taglineLabel = UILabel(text: "Description", font: .systemFont(ofSize: 12))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setupConstraints()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 6
        nameLabel.numberOfLines = 0
        taglineLabel.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let drink: Category = value as? Category else { return }
        
        ImageManager.shared.fetchImage(from: drink.imageURL) { [weak self] drinkImage in
            self?.drinkImageView.image = drinkImage
        }
        
        nameLabel.text = drink.name
        taglineLabel.text = drink.tagline
    }
    
}

// MARK: - Setup constraints
extension DrinkCell {
    private func setupConstraints() {
        drinkImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        taglineLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(drinkImageView)
        addSubview(nameLabel)
        addSubview(taglineLabel)
        
        NSLayoutConstraint.activate([
            drinkImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            drinkImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            drinkImageView.heightAnchor.constraint(equalToConstant: 78),
            drinkImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: drinkImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            taglineLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            taglineLabel.leadingAnchor.constraint(equalTo: drinkImageView.trailingAnchor, constant: 16),
            taglineLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
        ])
        
    }
    
}

