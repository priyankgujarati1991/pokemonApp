//
//  DetailViewModel.swift
//  PokemonApp
//
//  Created by Priyank on 07/07/22.
//

import Foundation
class DetailViewModel: NSObject {
    
    
    private var pokManager : PokemonManager!
//    var pokemonList = [Pokemon]()
    
    override init(){
        super.init()
        self.pokManager = PokemonManager()
        self.getPokemonDetailList()
    }
    
    func getPokemonDetailList(){
        self.pokManager.getDetailPokemon(id: 1){ (data) in
//            self.pokemonList = data
        }
    }
}
