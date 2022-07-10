//
//  NetworkManager.swift
//  NetworkingHomeWork
//
//  Created by Pavel Naumov on 09.07.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchDataWithAlamofire(link: String, completion: @escaping(Result<Fact, NetworkError>) -> Void) {
        AF.request(link).validate().responseJSON { dataResponse in
            switch dataResponse.result {
            case .success(let value):23
                let fact = Fact.getFact(from: value)
                DispatchQueue.main.async {
                    completion(.success(fact))
                }
            case .failure:
                completion(.failure(.decodingError))
            }
        }
    }
}
