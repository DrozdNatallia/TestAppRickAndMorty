//
//  NetworkProvaider.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 19.08.23.
//

import UIKit

protocol NetworkProvaiderProtocol {
    func getcountFromUrl (completion: @escaping (CoutOfCharacters) -> Void)
    func getDataFromURL (count: Int, completion: @escaping ([InfoCharacters]) -> Void)
}

final class NetworkProvaider: NetworkProvaiderProtocol {
    
    func getcountFromUrl (completion: @escaping (CoutOfCharacters) -> Void) {
        if let url = URL(string: Constants.baseUrl) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, _, error in
                guard self != nil else { return }
                if error != nil {
                }
                if let data = data {
                    do {
                        let weather = try JSONDecoder().decode(CoutOfCharacters.self, from: data)
                        completion(weather)
                    } catch {
                        print (error.localizedDescription)
                    }
                }
            }
            task.resume()
        }
    }
    
    func getDataFromURL (count: Int, completion: @escaping ([InfoCharacters]) -> Void) {
        let array = Array(1...count).map{ String($0)}.joined(separator: ",")
        if let url = URL(string: "\(Constants.baseUrl)\(array)") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, _, error in
                guard self != nil else { return }
                if error != nil {
                }
                if let data = data {
                    do {
                        let info = try JSONDecoder().decode([InfoCharacters].self, from: data)
                        completion(info)
                    } catch {
                        print (error.localizedDescription)
                    }
                }
            }
            task.resume()
        }
    }
}
