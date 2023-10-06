//
//  ViewController.swift
//  PokemonDemoApp
//
//  Created by Vusal Nuriyev on 07.10.23.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var pokemonTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    var pokemonVM: PokenViewModel = PokenViewModel()
    
    var pokemons: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///Get Pokemon Names
        pokemons = Pokemons.names
        
        setupUI()
    }

    private func setupUI() {
        view.addSubview(pokemonTableView)
        
        NSLayoutConstraint.activate([
            pokemonTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pokemonTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pokemonTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pokemonTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = pokemons[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Task {
            do {
                let pokemonDetail = try await pokemonVM.retrievePokemonDetails(name: pokemons[indexPath.row].lowercased())
                
                let vc = PokemonDetailsViewController()
                vc.pokemonDetail = pokemonDetail
                present(vc, animated: true)
                
            } catch {
                print("Error: \(error)")
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
