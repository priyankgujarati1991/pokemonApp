//
//  HomeViewController.swift
//  PokemonApp
//
//  Created by Priyank on 07/07/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    
    private var viewModel: HomeViewModel!
    var pokemonList = [Pokemon]()
    var pokemonDetailList = [PokemonDetailModel] ()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModel()
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    func callToViewModel() {
        self.viewModel = HomeViewModel()
        DispatchQueue.main.async {
            self.pokemonList = self.viewModel.pokemonList
            self.pokemonDetailList = self.viewModel.pokemonDetailList
//            print("UI view pokemonlist\(self.pokemonList)")
        }
        
//         self.homeViewModel.call()
//        self.pokemonList = fetchPokemonlist
        
//        self.homeViewModel.callFuncToGetPokemon()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as! PokemonCollectionViewCell
//        let pokemon =  self.pokemonList[indexPath.item]
        cell.pokemonName.text = "Testing"
//        let pokemonDetail = self.pokemonDetailList[indexPath.item]
//        cell.pokemonFrontDefaultImageView.ima
        
//        cell.pokemonFrontDefaultImageView = pokemon.
        return cell
    }
    
}
