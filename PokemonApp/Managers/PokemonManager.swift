//
//  PokemonManagers.swift
//  PokemonApp
//
//  Created by Priyank on 09/07/22.
//

import Foundation

class PokemonManager: NSObject {
    
    
    func getPokemon(completionGetPokemonList : @escaping([Pokemon]) ->()) {
        
        Helpers.fetchData(url: "https://pokeapi.co/api/v2/pokemon?limit=20", model: PokemonModel.self){ [self] completion in

//            self.pokemonList = completion.results
//            let tempcompletiongetPokemon = completion.results
            completionGetPokemonList(completion.results)

        }failure: { (error) in
            print(error)
        }
    }
    
    func getDetailPokemon(id: Int, completionGetPokemonDetail: @escaping(PokemonDetailModel) -> ()) {
        
        Helpers.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: PokemonDetailModel.self){ [self] completion in
            
            completionGetPokemonDetail(completion)

        }failure: { (error) in
            print(error)
        }
    }
}
