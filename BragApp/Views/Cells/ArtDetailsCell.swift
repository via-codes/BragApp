//
//  ArtDetailsCell.swift
//  BragApp
//
//  Created by Alivia Fairchild on 9/25/23.
//

import UIKit

class ArtDetailsCell: UICollectionViewCell {
    static let reuseID = "ArtDetailsCell"
    
    let artImageView = ArtImageView(frame: .zero)
    let artistNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(art: Art) {
        artistNameLabel.text = art.title
    }
    
    private func configure() {
        addSubview(artImageView)
        addSubview(artistNameLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            artImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            artImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            artImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            artImageView.heightAnchor.constraint(equalTo: artImageView.widthAnchor),
            
            artistNameLabel.topAnchor.constraint(equalTo: artImageView.bottomAnchor, constant: 12),
            artistNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            artistNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            artistNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
    
}
