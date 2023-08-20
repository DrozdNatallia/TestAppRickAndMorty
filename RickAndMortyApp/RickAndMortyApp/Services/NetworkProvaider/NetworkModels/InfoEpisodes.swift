//
//  InfoEpisodes.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 20.08.23.
//

import Foundation

// MARK: - InfoEpisodes
struct InfoEpisodes: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
struct InfoOrigin: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
