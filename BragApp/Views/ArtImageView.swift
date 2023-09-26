//
//  ArtImageView.swift
//  BragApp
//
//  Created by Alivia Fairchild on 9/25/23.
//

import UIKit
import SDWebImage

class ArtImageView: UIImageView {
    
    var art = Art.self
    let placeHolderImage = UIImage(named: "themetlogo")!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
        placeHolderImage.sd_setImage(with: URL(string: art.primaryImage ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
    }

}


