//
//  CollectionViewController.swift
//  BragApp
//
//  Created by Alivia Fairchild on 9/21/23.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var art: [Art] = []
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Art>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchDetailsForAllObjects(completed: displayArt)
        configureViewController()
        configureCollectionView()
//        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
    }
    
    func createFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    func displayArt(for art: [Art]) {
        // do UI stuff
//        dataSource = UICollectionViewDiffableDataSource<Section, Art>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, art) -> UICollectionViewCell? in
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtDetailsCell.reuseID, for: indexPath) as! ArtDetailsCell
//            cell.set(art: art)
//            return cell
//        })
    }
    
//    func configureDataSource() {
//        dataSource = UICollectionViewDiffableDataSource<Section, Art>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, art) -> UICollectionViewCell? in
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtDetailsCell.reuseID, for: indexPath) as! ArtDetailsCell
//            cell.set(art: art)
//            return cell
//        })
//    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Art>()
        snapshot.appendSections([.main])
        snapshot.appendItems(art)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
}
