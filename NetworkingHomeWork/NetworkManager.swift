//
//  NetworkManager.swift
//  NetworkingHomeWork
//
//  Created by Pavel Naumov on 09.07.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping(Fact) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let fact = try JSONDecoder().decode(Fact.self, from: data)
                DispatchQueue.main.async {
                    completion(fact)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}
