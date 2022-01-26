//
//  ComboCell.swift
//  HammerSystemsTest
//
//  Created by Михаил Кулагин on 25.01.2022.
//

import UIKit

class ComboCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "ComboCell"
    
    let comboImageView = UIImageView()
    let nameLabel = UILabel(text: "Name", font: .systemFont(ofSize: 18))
    let taglineLabel = UILabel(text: "Description", font: .systemFont(ofSize: 12))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setupConstraints()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let combo: Category = value as? Category else { return }
        comboImageView.image = UIImage(named: combo.imageURL)
        nameLabel.text = combo.name
        taglineLabel.text = combo.tagline
    }
    
}

// MARK: - Setup constraints
extension ComboCell {
    private func setupConstraints() {
        comboImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        taglineLabel.translatesAutoresizingMaskIntoConstraints = false
                
        addSubview(comboImageView)
        addSubview(nameLabel)
        addSubview(taglineLabel)
        
        NSLayoutConstraint.activate([
            comboImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            comboImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            comboImageView.heightAnchor.constraint(equalToConstant: 78),
            comboImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: comboImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            taglineLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            taglineLabel.leadingAnchor.constraint(equalTo: comboImageView.trailingAnchor, constant: 16),
            taglineLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
        ])
        
    }
    
}
