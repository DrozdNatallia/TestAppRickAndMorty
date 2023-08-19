//
//  CollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 18.08.23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "collectionCell"
    
    private lazy var imagesView: UIImageView = {
        var icon = UIImageView()
        icon.layer.cornerRadius = 15
        icon.layer.masksToBounds = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.backgroundColor = UIColor(red: 38.0 / 255.0, green: 42.0 / 255.0, blue: 56.0 / 255.0, alpha: 1.0)
        icon.contentMode = .scaleAspectFit
        return icon
    }()

    private lazy var nameCharacter: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.layer.cornerRadius = 15
        lbl.layer.masksToBounds = true
        lbl.backgroundColor = UIColor(red: 38.0 / 255.0, green: 42.0 / 255.0, blue: 56.0 / 255.0, alpha: 1.0)
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = lbl.font.withSize(25)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(red: 38.0 / 255.0, green: 42.0 / 255.0, blue: 56.0 / 255.0, alpha: 1.0)
        contentView.addSubview(self.imagesView)
        contentView.addSubview(self.nameCharacter)
        
        let radius: CGFloat = 15
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true

        NSLayoutConstraint.activate([
           self.imagesView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
           self.imagesView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
           self.imagesView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
           self.imagesView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5),
           self.imagesView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.7),
            
            
            self.nameCharacter.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.nameCharacter.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            self.nameCharacter.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            self.nameCharacter.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5),
            self.nameCharacter.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.2)
    
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configured(name: String, image: UIImage) {
        DispatchQueue.main.async {
            self.nameCharacter.text = name
            self.imagesView.image = image
        }
    }
}
