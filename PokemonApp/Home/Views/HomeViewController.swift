//
//  HomeViewController.swift
//  PokemonApp
//
//  Created by Priyank on 07/07/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    
    
    private var viewModel: HomeViewModel!
    var pokemonList = [Pokemon]()
    var pokemonDetailList = [PokemonDetailModel] ()
    var pokemonNameImage = [String] ()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        self.viewModel = HomeViewModel()
        self.viewModel.collView = self.collectionView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.pokemonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as! PokemonCollectionViewCell
        let pokemon =  self.viewModel.pokemonList[indexPath.item]
        
        cell.pokemonName.text = pokemon.name
        cell.backgroundColor = .green
//        let pokemonDetail = self.pokemonDetailList[indexPath.item]
        if let detail = pokemon.model, let url = URL(string: detail.sprites.other.home.front_default){
            cell.pokemonFrontDefaultImageView.load(url: url)
        }
//        
        
//        cell.pokemonFrontDefaultImageView = pokemon.
        return cell
    }
    
}
