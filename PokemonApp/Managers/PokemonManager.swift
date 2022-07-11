//
//  PokemonManagers.swift
//  PokemonApp
//
//  Created by Priyank on 09/07/22.
//

import Foundation

class PokemonManager {
    
    private let baseURL = "https://pokeapi.co/api/v2/pokemon"
    
    func getPokemon(completionGetPokemonList : @escaping([Pokemon]) ->()) {
        
        print(baseURL.appending("?limit=\(20)"))
        
        Helpers.fetchData(url: baseURL.appending("?limit=\(20)"), model: PokemonModel.self){ [self] completion in
            
            completionGetPokemonList(completion.results)

        }failure: { (error) in
            print(error)
        }
    }
    
    func getDetailPokemon(id: Int, completionGetPokemonDetail: @escaping(PokemonDetailModel) -> ()) {
        
        Helpers.fetchData(url: baseURL.appending("/\(id)/"), model: PokemonDetailModel.self){ [self] completion in
            
            completionGetPokemonDetail(completion)

        }failure: { (error) in
            print(error)
        }
    }
}
