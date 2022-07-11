//
//  HomeViewController.swift
//  PokemonApp
//
//  Created by Priyank on 07/07/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private var homeViewModel : HomeViewModel!
    var pokemonList = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModel()
        
        // Do any additional setup after loading the view.
    }
    
    func callToViewModel() {
        self.homeViewModel = HomeViewModel()
        DispatchQueue.main.async {
            self.pokemonList = self.homeViewModel.pokemonList
//            print("UI view pokemonlist\(self.pokemonList)")
        }
        
//         self.homeViewModel.call()
//        self.pokemonList = fetchPokemonlist
        
//        self.homeViewModel.callFuncToGetPokemon()
    }
    
    
    
    
}
