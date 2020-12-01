//
//  HeroesTableViewController.swift
//  MarvelHeroes
//
//  Created by Lemi Developer on 12/1/20.
//

import UIKit

class HeroesTableViewController: UITableViewController {
    
    // MARK: - Views
    
    private let tableViewActivityIndicator = UIActivityIndicatorView(style: .medium)
    
    // MARK: - Properties
    
    private var heroArray = [Hero]()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureTableView()
        getHeroes()
    }
    
    // MARK: - Methods
    
    private func configureUI() {
        title = "Heroes"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureTableView() {
        tableView.separatorStyle = .none
        tableView.register(HeroCell.self, forCellReuseIdentifier: HeroCell.reusableIdentifier)
        
        tableViewActivityIndicator.hidesWhenStopped = true
        tableViewActivityIndicator.frame = CGRect(x: 0, y: 0,
                                                  width: tableView.bounds.width,
                                                  height: 44)
        tableView.tableFooterView = tableViewActivityIndicator
    }
    
    private func getHeroes() {
        tableViewActivityIndicator.startAnimating()
        
        NetworkManager.shared.getHeroArray { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.tableViewActivityIndicator.stopAnimating()
                
                switch result {
                case .success(let heroArray):
                    self.heroArray = heroArray
                    self.tableView.reloadData()
                case . failure(let error):
                    print("Error: \(error.rawValue)")
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { heroArray.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeroCell.reusableIdentifier, for: indexPath) as! HeroCell
        cell.set(hero: heroArray[indexPath.row])
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let heroDetailsViewController = HeroDetailsViewController(hero: heroArray[indexPath.row])
        present(heroDetailsViewController, animated: true)
    }
}
