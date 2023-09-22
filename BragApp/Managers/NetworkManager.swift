//
//  NetworkManager.swift
//  BragApp
//
//  Created by Alivia Fairchild on 9/21/23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://collectionapi.metmuseum.org/public/collection/v1/"

    private init() {}
  
    func getArt(completed: @escaping (Result<[Art], ErrorMessage>) -> Void) {
        
        let endpoint = baseURL + "departments"
        //do I want to limit it to 80 somehow?
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            do {
                let artResponse = try decoder.decode(ArtResponse.self, from: data)
                completed(.success(artResponse.data))
            } catch {
                completed(.failure(.invalidData))
            }
        }

        task.resume()
    }
    
}
