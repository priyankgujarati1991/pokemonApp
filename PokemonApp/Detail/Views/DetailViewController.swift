//
//  DetailViewController.swift
//  PokemonApp
//
//  Created by Harsh on 07/07/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var pokemonDetail: PokemonDetailModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(pokemonDetail.height)
        print(pokemonDetail.weight)
        print(pokemonDetail.id)
    }
}
