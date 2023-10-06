//
//  PokemonModel.swift
//  PokemonDemoApp
//
//  Created by Vusal Nuriyev on 07.10.23.
//

import Foundation
import UIKit

struct PokemonModel: Codable {
    let name: String
    let imageName: String?
    let types: [PokemonTypes]
    let weight: Double
    let height: Double
   
    ///When we write these lines of code manually, we get json with less error
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.imageName = try container.decodeIfPresent(String.self, forKey: .imageName)
        self.types = try container.decode([PokemonTypes].self, forKey: .types)
        self.weight = try container.decode(Double.self, forKey: .weight)
        self.height = try container.decode(Double.self, forKey: .height)
    }
    
    enum CodingKeys: CodingKey {
        case name
        case imageName
        case types
        case weight
        case height
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.imageName, forKey: .imageName)
        try container.encode(self.types, forKey: .types)
        try container.encode(self.weight, forKey: .weight)
        try container.encode(self.height, forKey: .height)
    }
}

struct PokemonTypes: Codable {
    let type: PokemonType
    
    init(type: PokemonType) {
        self.type = type
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.type, forKey: .type)
    }
}

struct PokemonType: Codable {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
    }
}
