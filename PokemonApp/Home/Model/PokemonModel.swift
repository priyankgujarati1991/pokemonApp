//
//  PokemonModel.swift
//  PokemonApp
//
//  Created by Priyank on 07/07/22.
//

import Foundation

struct PokemonModel: Codable{
    let count: Int
    let next: String
    let results: [Pokemon]
}


struct Pokemon: Codable{
    let name: String
    let url: String
}
