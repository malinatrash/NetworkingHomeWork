//
//  Fact.swift
//  NetworkingHomeWork
//
//  Created by Pavel Naumov on 08.07.2022.
//

import Foundation

struct Fact: Decodable {
    let text: String?
    let number: Int?
    let found: Bool?
    let type: String?
    
    init(text: String?, number: Int?, found: Bool?, type: String?) {
        self.text = text
        self.number = number
        self.found = found
        self.type = type
    }
    
    init(factData: [String: Any]) {
        text = factData["text"] as? String
        number = factData["number"] as? Int
        found = factData["found"] as? Bool
        type = factData["type"] as? String
    }
    
    static func getFact(from value: Any) -> Fact {
        guard let factData = value as? [String: Any] else { return Fact(text: nil, number: nil, found: nil, type: nil) }
        let fact = Fact(factData: factData)
        return fact
    }
}
