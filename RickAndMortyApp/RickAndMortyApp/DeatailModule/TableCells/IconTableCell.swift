//
//  DetailedTableCell.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 19.08.23.
//

import UIKit

final class IconTableCell: UITableViewCell {
    static let key = "IconTableCell"
    
    private lazy var imagesView: UIImageView = {
        var icon = UIImageView()
        icon.layer.cornerRadius = 15
        icon.layer.masksToBounds = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.backgroundColor = .clear
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    private lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = lbl.font.withSize(22)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var statusLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.layer.cornerRadius = 15
        lbl.layer.masksToBounds = true
        lbl.backgroundColor = .clear
        lbl.textAlignment = .center
        lbl.textColor = UIColor(red: 71.0 / 255.0, green: 198.0 / 255.0, blue: 11.0 / 255.0 , alpha: 1.0)
        lbl.font = lbl.font.withSize(16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(red: 4.0 / 255.0, green: 12.0 / 255.0, blue: 30.0 / 255.0 , alpha: 1.0)
        self.addSubviews()
        self.setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.contentView.addSubview(self.imagesView)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.statusLabel)
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            self.imagesView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.imagesView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.imagesView.widthAnchor.constraint(equalToConstant: 148),
            self.imagesView.heightAnchor.constraint(equalToConstant: 148),
            self.nameLabel.topAnchor.constraint(equalTo: self.imagesView.bottomAnchor, constant: 10),
            self.nameLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.nameLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            self.nameLabel.heightAnchor.constraint(equalToConstant: 25),
            self.statusLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5),
            self.statusLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.statusLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            self.nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configured(name: String, status: String, image: UIImage) {
        DispatchQueue.main.async {
            self.nameLabel.text = name
            self.statusLabel.text = status
            self.imagesView.image = image
        }
    }
}
