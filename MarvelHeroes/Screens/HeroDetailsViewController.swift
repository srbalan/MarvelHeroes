//
//  HeroDetailsViewController.swift
//  MarvelHeroes
//
//  Created by Lemi Developer on 12/1/20.
//

import UIKit

class HeroDetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    private var hero: Hero!
    
    // MARK: - Views
    
    private let scrollView = UIScrollView()
    private let avatarImageView = AvatarImageView(frame: .zero)
    private let detailsStackView = UIStackView()
    private let nameLabel = UILabel()
    private let nameContentLabel = UILabel()
    private let realnameLabel = UILabel()
    private let realnameContentLabel = UILabel()
    private let teamLabel = UILabel()
    private let teamContentLabel = UILabel()
    private let bioLabel = UILabel()
    private let bioContentLabel = UILabel()

    init(hero: Hero) {
        super.init(nibName: nil, bundle: nil)
        
        self.hero = hero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Methods
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let wrapperView = UIView()
        wrapperView.backgroundColor = .systemBackground
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(wrapperView)
        
        NSLayoutConstraint.activate([
            wrapperView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            wrapperView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            wrapperView.widthAnchor.constraint(equalTo: view.widthAnchor),
            wrapperView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        wrapperView.addSubviews(avatarImageView, detailsStackView)
        
        avatarImageView.downloadImage(fromURL: hero.imageurl)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: wrapperView.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            avatarImageView.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 190)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageDidTap))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGesture)
        
        detailsStackView.axis = .vertical
        detailsStackView.spacing = 12
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailsStackView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: Layout.defaultPadding),
            detailsStackView.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: Layout.defaultPadding),
            detailsStackView.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -Layout.defaultPadding),
            detailsStackView.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor)
        ])
        
        let nameView = DetailsView(frame: .zero)
        nameView.set(title: "Name", detail: hero.name)
        
        detailsStackView.addArrangedSubview(nameView)
        
        let realnameView = DetailsView(frame: .zero)
        realnameView.set(title: "Real Name", detail: hero.realname)
        
        detailsStackView.addArrangedSubview(realnameView)
        
        let teamView = DetailsView(frame: .zero)
        teamView.set(title: "Team", detail: hero.team)
        
        detailsStackView.addArrangedSubview(teamView)
        
        let bioView = DetailsView(frame: .zero)
        bioView.set(title: "Bio", detail: hero.bio)
        
        detailsStackView.addArrangedSubview(bioView)
        
        let spacerView = UIView()
        spacerView.backgroundColor = .systemBackground
        spacerView.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        detailsStackView.addArrangedSubview(spacerView)
    }
    
    @objc private func imageDidTap() {
        print("# Image Did Tap")
    }
}
