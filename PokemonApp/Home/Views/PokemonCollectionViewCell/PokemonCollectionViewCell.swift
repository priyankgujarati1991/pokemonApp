//
//  PokemonCollectionViewCell.swift
//  PokemonApp
//
//  Created by Priyank on 12/07/22.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    static let identifier = "PokemonCollectionViewCell"
    
    var pokemonName: UILabel = {
            let label = UILabel()
            label.textColor = UIColor.black
            label.font = UIFont.systemFont(ofSize: 14)
//            label.text = "424 likes"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    var pokemonFrontDefaultImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(pokemonName)
        contentView.addSubview(pokemonFrontDefaultImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pokemonFrontDefaultImageView.frame = CGRect(x: 5, y: 5, width: contentView.frame.size.width - 10, height:contentView.frame.size.height  - 20)
        pokemonName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        pokemonName.topAnchor.constraint(equalTo: pokemonFrontDefaultImageView.lastBaselineAnchor, constant: 0).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
