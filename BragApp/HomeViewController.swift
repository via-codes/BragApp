//
//  HomeViewController.swift
//  BragApp
//
//  Created by Alivia Fairchild on 9/20/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var titleStackView: UIStackView!
    var art = [Department]()
    let logoImageView = UIImageView()
    let viewCollectionButton = CustomUIButton(backgroundColor: .systemGray2, title: "View Collection")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        configureBackgroundImageView()
        configureViewCollectionButton()
        viewCollectionButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
    }
    
    @objc func buttonAction(_ sender:UIButton!) {
        print("Button tapped")
        getArt()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let collectionViewController = storyboard.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        navigationController?.pushViewController(collectionViewController, animated: true)
    }
    
    
    func getArt() {
        NetworkManager.shared.getArt() { result in
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let art):
                    self.art = art
                    print("poop")
                case .failure(let error):
                    self.presentAlert(error: error)
                }
            }
        }
    }
    
    func presentAlert(error: ErrorMessage) {
        let dialogMessage = UIAlertController(title: "Something Went Wrong", message: error.rawValue, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
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

