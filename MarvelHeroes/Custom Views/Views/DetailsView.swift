//
//  DetailsView.swift
//  MarvelHeroes
//
//  Created by Lemi Developer on 12/1/20.
//

import UIKit

class DetailsView: UIView {
    private let titleLabel = UILabel()
    private let detailLabel = UILabel()
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func configureUI() {
        backgroundColor = .systemBackground
        
        addSubview(stackView)
        
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.textColor = .systemGray2
        
        detailLabel.font = .boldSystemFont(ofSize: 16)
        detailLabel.textColor = .label
        detailLabel.numberOfLines = 0
        
        stackView.axis = .vertical
        stackView.spacing = 4
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailLabel)
        
        stackView.pinToEdges(of: self)
    }
    
    func set(title: String, detail: String) {
        titleLabel.text = title
        detailLabel.text = detail
    }
}
