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
}
