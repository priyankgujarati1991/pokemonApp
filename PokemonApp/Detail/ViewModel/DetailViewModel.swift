//
//  DetailViewModel.swift
//  PokemonApp
//
//  Created by Harsh on 07/07/22.
//

import Foundation
class DetailViewModel {
    
    
    private var pokemonManager: PokemonManager!
//    var pokemonList = [Pokemon]()
    
     init() {
        self.pokemonManager = PokemonManager()
        self.getPokemonDetailList()
    }
    
    func getPokemonDetailList() {
        self.pokemonManager.getDetailPokemon(id: 1){ (data) in
//            self.pokemonList = data
        }
    }
}
