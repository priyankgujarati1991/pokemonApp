//
//  HomeViewModel.swift
//  PokemonApp
//
//  Created by Priyank on 07/07/22.
//

import Foundation

class HomeViewModel {
    
    private var pokmonManager: PokemonManager
    var pokemonList = [Pokemon] ()
    var pokemonDetailList = [PokemonDetailModel] ()
    let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
    
     init() {
        self.pokmonManager = PokemonManager()
        self.getPokemonList()
    }
    
    func getPokemonList() {
        self.pokmonManager.getPokemon{ (data) in
            self.pokemonList = data
            self.getPokemonIndex()
        }
    }
    
    func getPokemonIndex() {
        let group = DispatchGroup()
//        let semaphore = DispatchSemaphore(value: 1)
        var item = 0
        for (index, element) in self.pokemonList.enumerated() {
            group.enter()
            concurrentQueue.async{
//                semaphore.wait()
                item = index + 1
                self.pokmonManager.getDetailPokemon(id: item){(detailPokemon) in
                    print(detailPokemon, element)
                    self.pokemonDetailList.append(detailPokemon)
                    group.leave()
                }
//                semaphore.signal()
//                group.leave()
            }
        }
        group.notify(queue: DispatchQueue.main) {
            print("completion done")
        }
    }
    
}
