//
//  ModuleBuilder.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 19.08.23.
//

import UIKit

protocol AsselderBuildProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailedModule(router: RouterProtocol, id: Int) -> UIViewController 
}

class BuilderClass: AsselderBuildProtocol {
    
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let mainViewController = MainViewController()
        let networkProvaider = NetworkProvaider()
        let mainModel = CharactersModel()
        let presenter = MainPresenter(view: mainViewController, model: mainModel, provaider: networkProvaider, router: router)
        mainViewController.presenter = presenter
        return mainViewController
    }
    
    func createDetailedModule(router: RouterProtocol, id: Int) -> UIViewController {
        let detailedViewController = DetailedViewController()
        let networkProvaider = NetworkProvaider()
        let detailModel = DetailsModel(character: nil)
        let presenter = DetailedViewPresenter(view: detailedViewController, provaider: networkProvaider, router: router, id: id, model: detailModel)
        detailedViewController.presenter = presenter
        return detailedViewController
    }
}
