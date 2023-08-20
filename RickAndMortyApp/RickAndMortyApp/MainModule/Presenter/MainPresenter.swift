//
//  MainPresenter.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 19.08.23.
//

import UIKit

protocol MainViewBusinessLogic {
    func getInfoCharacters()
    func getImagebyURL(url: String) -> UIImage
    func openDetailedVc(id: Int)
}

final class MainPresenter {
    private weak var view: MainViewControllerDisplayLogic?
    private var model: CharactersModel?
    private var networkProvaider: NetworkProvaiderProtocol?
    private var router: RouterProtocol?
    
    required init (view: MainViewControllerDisplayLogic, model: CharactersModel, provaider: NetworkProvaiderProtocol, router: RouterProtocol) {
        self.view = view
        self.model = model
        self.networkProvaider = provaider
        self.router = router
    }
    
}

extension MainPresenter: MainViewBusinessLogic {
    // Получение информации о персонажах
    
    func getInfoCharacters() {
        
        self.networkProvaider?.getcountFromUrl(completion: { count in
            self.networkProvaider?.getDataFromURL(count: count.info.count, completion: { infoCharacters in
                guard var model = self.model else { return }
                model.arrayCharacter = infoCharacters
                self.view?.displayData(model: model)
            })
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
    
    //открытие второго экрана
    func openDetailedVc(id: Int){
        self.router?.openDetailedViewController(id: id)
    }
}
