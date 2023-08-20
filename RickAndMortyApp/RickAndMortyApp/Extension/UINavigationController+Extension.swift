//
//  UINavigationController+Extensione.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 20.08.23.
//

import UIKit

extension UINavigationController {
    func addCustomBackButton(title: String = "Back") {
        let backButton = UIBarButtonItem()
        backButton.title = title
        navigationBar.topItem?.backBarButtonItem = backButton
    }
}
