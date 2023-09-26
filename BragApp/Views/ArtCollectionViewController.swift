//
//  CollectionViewController.swift
//  BragApp
//
//  Created by Alivia Fairchild on 9/21/23.
//

import Foundation
import UIKit

class ArtCollectionViewController: UIViewController {

    var collectionView: UICollectionView!
    var cellID = ArtDetailsCell.self
    var art: [Art] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchDetailsForAllObjects(completed: displayArt)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    override func loadView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view = collectionView

    }
    
    func displayArt(for art: [Art]) {
        // do UI stuff
        print(art)
    
    }
}

extension ArtCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return art.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID.reuseID, for: indexPath) as! ArtDetailsCell
        cell.art = self.art[indexPath.item]
        cell.backgroundColor = .systemBlue
        return cell
    }
    
    
}
