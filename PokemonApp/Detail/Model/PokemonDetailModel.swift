//
//  PokemonDetailModel.swift
//  PokemonApp
//
//  Created by Priyank on 07/07/22.
//

import Foundation

//MARK: - PokemonDetailModel
struct PokemonDetailModel: Codable {
    let id: Int
    let height: Int
    let weight: Int
    let sprites: sprites
}

// MARK: - Sprites
struct sprites: Codable {
    let other: other
}

struct other: Codable {
    let home: home
}

struct home: Codable {
    let front_default: String
}
