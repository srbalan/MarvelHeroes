//
//  AvatarImageView.swift
//  MarvelHeroes
//
//  Created by Lemi Developer on 12/1/20.
//

import UIKit

class AvatarImageView: UIImageView {
    
    let placeholderImage = Images.icon

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        contentMode = .scaleAspectFill
        clipsToBounds = true
        image = placeholderImage
    }
    
    func downloadImage(fromURL url: String) {
        NetworkManager.shared.downloadImage(from: url) { [weak self] (image) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
