//
//  ModuleBuilder.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 19.08.23.
//

import UIKit

protocol AsselderBuildProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
}

class BuilderClass: AsselderBuildProtocol {
    
    // MARK: Настройка основного контроллера
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let mainViewController = MainViewController()
        let networkProvaider = NetworkProvaider()
        let mainModel = CharactersModel()
        let presenter = MainPresenter(view: mainViewController, model: mainModel, provaider: networkProvaider, router: router)
        mainViewController.presenter = presenter
        return mainViewController
    }
}
