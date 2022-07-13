//
//  HomeViewModel.swift
//  PokemonApp
//
//  Created by Priyank on 07/07/22.
//

import UIKit
import Foundation
import ESPullToRefresh
class HomeViewModel {
    
    private var pokmonManager: PokemonManager
    var pokemonList = [Pokemon] ()
    var collView : UICollectionView?
    var page: Int = 20
    var totalCount = 0
    let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
    
     init() {
        self.pokmonManager = PokemonManager()
        self.getPokemonList(id: page)
    }
    
    func getPokemonList(id: Int) {
        self.pokmonManager.getPokemon(id: id){ (data,count)  in
            self.pokemonList = data
            self.totalCount = count
            self.getPokemonIndex()
        }
    }
    
    func getPokemonIndex() {
        let group = DispatchGroup()
        var item = 0
        for (index, _) in self.pokemonList.enumerated() {
            group.enter()
            concurrentQueue.async{
                item = index + 1
                self.pokmonManager.getDetailPokemon(id: item){(detailPokemon) in
                    self.pokemonList[index].detailmodel = detailPokemon
                    group.leave()
                }
            }
        }
        group.notify(queue: DispatchQueue.main) {
            self.collView?.reloadData()
        }
    }
    
    func infiniteScrolling() {
        self.collView?.es.addInfiniteScrolling {
            if self.page < self.totalCount {
                self.page = self.page + 20
                self.getPokemonList(id: self.page)
            }
        }
    }
}
