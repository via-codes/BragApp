//
//  NetworkManager.swift
//  BragApp
//
//  Created by Alivia Fairchild on 9/21/23.
//

import Foundation

//relearn singletons https://www.youtube.com/watch?si=x_z2Fw8WKMKivjMr&v=3OMz0LgapFM&feature=youtu.be
// sean allens result type video
// review and utilize the trailing closer for the completed param


class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://collectionapi.metmuseum.org/public/collection/v1/"

    private init() {}

//    func getDetailsForAllObjects() -> Int {
//        // for loop for ObjectIDs
//        // for each ObjectID -> getArt()
//        
//        
//        
//        for objectId in 1...80 {
//            fetchDetailsForObject(for: objectId) { result in
//                DispatchQueue.main.async { [self] in
//                    switch result {
//                    case .success(let art):
//                        print(Art)
//                    case .failure(let error):
//                        HomeViewController.presentAlert(error.rawValue)
////                        self.presentAlert(error: error)
//                    }
//                }
//            }
//        }
//        
//    }
    
    // change this to fetchDetailsForObject()
    func fetchDetailsForObject(for objectID: Int, completed: @escaping (Result<[Art], ErrorMessage>) -> Void) {
        // endpoint is the one specific to what I want - use the baseURL just to get to the API
        let endpoint = baseURL + "objects/\(objectID)"
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidData))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let artResponse = try decoder.decode([Art].self, from: data)
                completed(.success(artResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }

        task.resume()
    }
    
}
