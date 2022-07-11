//
//  HomeViewModel.swift
//  PokemonApp
//
//  Created by Priyank on 07/07/22.
//

import Foundation

class HomeViewModel: NSObject {
    
    private var pokManager : PokemonManager!
    var pokemonList = [Pokemon]()
    let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
    
    override init(){
        super.init()
        self.pokManager = PokemonManager()
        self.getPokemonList()
    }
    
    func getPokemonList(){
        self.pokManager.getPokemon{ (data) in
            self.pokemonList = data
            self.getPokemonIndex()
        }
    }
    
    func getPokemonIndex(){
//        let group = DispatchGroup()
        let semaphore = DispatchSemaphore(value: 1)
        var item = 0
        for (index, element) in self.pokemonList.enumerated() {
//            group.enter()
            concurrentQueue.async{
                semaphore.wait()
                item = index + 1
                self.pokManager.getDetailPokemon(id: item){(detailPokemon) in
                    print(detailPokemon)
                }
                semaphore.signal()
//                group.leave()
            }
        }
//        group.notify(queue: DispatchQueue.main) {
//            print("completion done")
//        }
    }
    
}
