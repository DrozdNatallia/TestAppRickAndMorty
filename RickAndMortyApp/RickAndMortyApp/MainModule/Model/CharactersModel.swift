//
//  CharactersModel.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 19.08.23.
//

import UIKit

struct CharactersModel {
    var arrayCharacter: [InfoCharacters]
    
    init (arrayCharacter: [InfoCharacters] = []) {
        self.arrayCharacter = arrayCharacter
    }
}
