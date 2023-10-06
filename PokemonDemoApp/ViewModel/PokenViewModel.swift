//
//  PokenViewModel.swift
//  PokemonDemoApp
//
//  Created by Vusal Nuriyev on 07.10.23.
//

import UIKit

class PokenViewModel {

    var apiConnection: APIConnection = APIConnection()
    
    var pokemonDetail: PokemonModel?
    
    func retrievePokemonDetails(name: String) async throws -> PokemonModel? {
        do {
            let pokemonDetail = try await apiConnection.getPokemons(name: name)
            return pokemonDetail
        } catch {
            print("Error fetching pokemon details: \(error)")
            return nil
        }
    }

    
}
