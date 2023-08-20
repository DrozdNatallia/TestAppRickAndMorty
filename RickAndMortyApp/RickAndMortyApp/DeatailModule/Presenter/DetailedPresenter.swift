//
//  DetailedPresenter.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 19.08.23.
//

import UIKit

protocol DetailedViewBusinessLogic {
    func getCharacterById()
    func getImagebyURL(url: String) -> UIImage
    func getInfoOrigin(url: String)
}

final class DetailedViewPresenter {
    
    private weak var view: DetailedViewControllerDisplayLogic?
    private var model: DetailsModel?
    private var networkProvaider: NetworkProvaiderProtocol?
    private var router: RouterProtocol?
    private var idOfCharacters: Int?
    
    required init (view: DetailedViewControllerDisplayLogic, provaider: NetworkProvaiderProtocol, router: RouterProtocol, id: Int, model: DetailsModel) {
        self.view = view
        self.model = model
        self.networkProvaider = provaider
        self.router = router
        self.idOfCharacters = id
    }
}

extension DetailedViewPresenter: DetailedViewBusinessLogic {
    
    func getCharacterById() {
        guard let id = self.idOfCharacters else { return }
        self.networkProvaider?.getInfoById(id: id, completion: { info in
            guard var model = self.model else { return }
            model.character = info
            let arrayUrl = info.episode
            var episodeArray: [InfoEpisodes] = []
            for url in arrayUrl {
                self.networkProvaider?.getInfoEpisodes(url: url, completion: { infoEpisode in
                    episodeArray.append(infoEpisode)
                    if episodeArray.count == info.episode.count {
                        self.view?.displayData(model: model, episodes: episodeArray)
                        self.view?.getOrigin()
                    }
                })
            }
        })
    }
    
    func getImagebyURL(url: String) -> UIImage {
        if let url = URL(string: url) {
            do {
                let data = try Data(contentsOf: url)
                guard let icon = UIImage(data: data) else {return UIImage()}
                return icon
            } catch let error {
                print(error.localizedDescription)
            }
        }
        return UIImage()
    }
    
    func getInfoOrigin(url: String) {
        self.networkProvaider?.getInfoOrigin(url: url, completion: { origin in
            self.view?.setOriginInfo(origin: origin)
        })
    }
}
