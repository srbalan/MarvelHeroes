//
//  HeroCell.swift
//  MarvelHeroes
//
//  Created by Lemi Developer on 12/1/20.
//

import UIKit

class HeroCell: UITableViewCell {
    static let reusableIdentifier = "HeroCell"
    
    private let avatarImageView = AvatarImageView(frame: .zero)
    private let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func set(hero: Hero) {
        avatarImageView.downloadImage(fromURL: hero.imageurl)
        nameLabel.text = hero.name
    }
    
    private func configureUI() {
        addSubviews(avatarImageView, nameLabel)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.defaultPadding),
            avatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            avatarImageView.heightAnchor.constraint(equalToConstant: 70),
            avatarImageView.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.textColor = .label
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.defaultPadding)
        ])
    }
}
