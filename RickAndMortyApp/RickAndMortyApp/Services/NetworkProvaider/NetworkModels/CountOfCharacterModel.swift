//
//  CountOfCharacterModel.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 19.08.23.
//

import Foundation

struct CoutOfCharacters: Codable {
    let info: Info
}
struct Info: Codable {
    let count: Int
}
