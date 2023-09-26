//
//  HomeViewController.swift
//  BragApp
//
//  Created by Alivia Fairchild on 9/20/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var titleStackView: UIStackView!
    let logoImageView = UIImageView()
    let viewCollectionButton = CustomUIButton(backgroundColor: .systemGray2, title: "View Collection")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //move this to collectionVC
//        NetworkManager.shared.fetchDetailsForAllObjects(completed: displayArt)
        configureBackgroundImageView()
        configureViewCollectionButton()
        viewCollectionButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
    }
    
    @objc func buttonAction(_ sender:UIButton!) {
        print("Button tapped")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let collectionViewController = storyboard.instantiateViewController(withIdentifier: "CollectionViewController") as! ArtCollectionViewController
        navigationController?.pushViewController(collectionViewController, animated: true)
    }
    
    //moved to collectionVC
//    func displayArt(for art: [Art]) {
//        // do UI stuff
//    }

    
// Bring this in a refactor down the road 
//    func presentAlert(error: ErrorMessage) {
//        let dialogMessage = UIAlertController(title: "Something Went Wrong", message: error.rawValue, preferredStyle: .alert)
//        let ok = UIAlertAction(title: "OK", style: .default)
//
//        dialogMessage.addAction(ok)
//        self.present(dialogMessage, animated: true, completion: nil)
//    }
//
    func configureBackgroundImageView() {
        view.addSubview(logoImageView)
        view.sendSubviewToBack(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "Madame_X")!
        
        NSLayoutConstraint.activate([
            logoImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    func configureViewCollectionButton() {
        viewCollectionButton.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        viewCollectionButton.isOpaque = false
        view.addSubview(viewCollectionButton)
        
        NSLayoutConstraint.activate([
            viewCollectionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            viewCollectionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            viewCollectionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            viewCollectionButton.heightAnchor.constraint(equalToConstant: 50)
                    
        ])
    }

}

