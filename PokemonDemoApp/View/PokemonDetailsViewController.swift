//
//  PokemonDetailsViewController.swift
//  PokemonDemoApp
//
//  Created by Vusal Nuriyev on 07.10.23.
//

import UIKit

class PokemonDetailsViewController: UIViewController {

    private lazy var pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir", size: 25)
        label.numberOfLines = 5
        label.textColor = UIColor.label
        return label
    }()
    
    private lazy var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var pokemonTypesListLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Medium", size: 20)
        label.numberOfLines = 10
        return label
    }()
    
    private lazy var pokemonWeightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Black", size: 20)
        label.numberOfLines = 5
        return label
    }()
    
    private lazy var pokemonHeightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Black", size: 20)
        label.numberOfLines = 5
        return label
    }()
        
    var pokemonDetail: PokemonModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        setupData()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(pokemonNameLabel)
        view.addSubview(pokemonImageView)
        view.addSubview(pokemonTypesListLabel)
        view.addSubview(pokemonWeightLabel)
        view.addSubview(pokemonHeightLabel)
        
        NSLayoutConstraint.activate([
            pokemonImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pokemonImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 250),
            pokemonImageView.heightAnchor.constraint(equalTo: pokemonImageView.widthAnchor, multiplier: 1),
            
            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: 30),
            pokemonNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            pokemonTypesListLabel.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor, constant: 20),
            pokemonTypesListLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pokemonTypesListLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            pokemonWeightLabel.topAnchor.constraint(equalTo: pokemonTypesListLabel.bottomAnchor, constant: 20),
            pokemonWeightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            pokemonHeightLabel.topAnchor.constraint(equalTo: pokemonWeightLabel.bottomAnchor, constant: 20),
            pokemonHeightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
           
    }
    
    private func setupData() {
        if let pokemonDetail = pokemonDetail {
            var types: String = ""
            
            for type in pokemonDetail.types {
                types += "\(type.type.name),"
            }
            pokemonNameLabel.text = pokemonDetail.name
            pokemonHeightLabel.text = "Height: \(pokemonDetail.height)"
            pokemonWeightLabel.text = "Weight: \(pokemonDetail.weight)"
            pokemonTypesListLabel.text = "Types: \(types)"
        }
    }

}
