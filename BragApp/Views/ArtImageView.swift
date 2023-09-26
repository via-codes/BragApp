//
//  ArtImageView.swift
//  BragApp
//
//  Created by Alivia Fairchild on 9/25/23.
//

import UIKit

class ArtImageView: UIImageView {
    
    let placeHolderImage = UIImage(named: "themetlogo")!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 8
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
    }

}

// imageView.sd_setImage(with: URL(string: art.primaryImage), placeholderImage: UIImage(named: "placeholder.png"))
