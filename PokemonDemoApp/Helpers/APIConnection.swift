//
//  APIConnection.swift
//  PokemonDemoApp
//
//  Created by Vusal Nuriyev on 07.10.23.
//

import Foundation

enum CustomError: String, Error {
    case invalidURL
}

struct APIConnection {
    let urlString: String = "https://pokeapi.co/api/v2/pokemon/"

    func getPokemons(name: String) async throws -> PokemonModel? {
        guard let url = URL(string: "\(urlString)\(name)") else {
            throw CustomError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let pokemon = try decoder.decode(PokemonModel.self, from: data)
        return pokemon
    }


    func jsonPaser(data: Data) -> PokemonModel? {
        do {
            let decoder = JSONDecoder()
            let pokemon = try decoder.decode(PokemonModel.self, from: data)
            return pokemon
            
        } catch {
            print("Failed to decode PokemonModel with error: \(error.localizedDescription)")
            return nil
        }
    }
    
}
