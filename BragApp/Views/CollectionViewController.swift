//
//  CollectionViewController.swift
//  BragApp
//
//  Created by Alivia Fairchild on 9/21/23.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController {
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchDetailsForAllObjects(completed: displayArt)
    }
    
    func displayArt(for art: [Art]) {
        // do UI stuff
        print(art)
    
    }
}
