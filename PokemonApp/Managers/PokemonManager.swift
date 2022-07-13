//
//  PokemonManagers.swift
//  PokemonApp
//
//  Created by Priyank on 09/07/22.
//

import Foundation

class PokemonManager {
    
    private let baseURL = "https://pokeapi.co/api/v2/pokemon"
    
    func getPokemon(id: Int, completionGetPokemonList : @escaping([Pokemon],_ count:Int) ->()) {
        
        Helpers.fetchData(url: baseURL.appending("?limit=\(id)"), model: PokemonModel.self){ [self] completion in
            
            completionGetPokemonList(completion.results, completion.count)

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
