//
//  Router.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 19.08.23.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AsselderBuildProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AsselderBuildProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AsselderBuildProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    // MARK: Инициализация рутового контроллера
    func initialViewController() {
        if let navigationController = self.navigationController {
            guard let homeViewController = assemblyBuilder?.createMainModule(router: self) else { return }
            navigationController.viewControllers = [homeViewController]
        }
    }
}



