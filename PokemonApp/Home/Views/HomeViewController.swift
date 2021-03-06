//
//  HomeViewController.swift
//  PokemonApp
//
//  Created by Harsh on 07/07/22.
//

import Foundation
import UIKit
import Kingfisher
import ESPullToRefresh

class HomeViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let viewModel: HomeViewModel
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var pokemonNameImage = [String] ()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        self.navigationController?.navigationBar.topItem?.title = "Pokemon"
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
        
        if let detail = pokemon.detailmodel, let url = URL(string: detail.sprites.other.home.front_default) {
            cell.pokemonFrontDefaultImageView.backgroundColor = .lightGray
            KingfisherManager.shared.retrieveImage(with: url, options: nil, progressBlock: nil) { result in
                switch result {
                case .success(let value):
                    cell.pokemonFrontDefaultImageView.image = value.image
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }else {
            cell.pokemonFrontDefaultImageView.image = UIImage()
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/2)-2, height: (view.frame.size.width/2)-2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == self.viewModel.pokemonList.count - 1 {  //pokemonList count
            self.viewModel.infiniteScrolling()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let pokemon =  self.viewModel.pokemonList[indexPath.item]
        let pokemonDetail = pokemon.detailmodel
        let detailVC  = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailVC.pokemonDetail = pokemonDetail
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
