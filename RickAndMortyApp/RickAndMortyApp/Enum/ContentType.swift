//
//  ContentType.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 20.08.23.
//

import Foundation

enum ContentType: Int {
    case icon = 0
    case info
    case origin
    case episodes
    var description: String {
        switch self {
        case .icon:
            return ""
        case .info:
            return "Info"
        case .origin:
            return "Origin"
        case .episodes:
            return "Episodes"
        }
    }
}
