//
//  OriginTableCell.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 19.08.23.
//

import UIKit

final class OriginTableCell: UITableViewCell {
    static let key = "OriginTableCell"
    
    private lazy var imagesView: UIImageView = {
        var icon = UIImageView()
        icon.image = UIImage(named: "Planet")
        icon.layer.cornerRadius = 15
        icon.layer.masksToBounds = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.backgroundColor = UIColor(red: 25.0 / 255.0, green: 28.0 / 255.0, blue: 42.0 / 255.0 , alpha: 1.0)
        icon.contentMode = .center
        return icon
    }()
    
    private lazy var locationLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = lbl.font.withSize(17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var nameLocationLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        lbl.textAlignment = .center
        lbl.textColor = UIColor(red: 71.0 / 255.0, green: 198.0 / 255.0, blue: 11.0 / 255.0 , alpha: 1.0)
        lbl.font = lbl.font.withSize(13)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(red: 38.0 / 255.0, green: 42.0 / 255.0, blue: 56.0 / 255.0, alpha: 1.0)
        self.addSubviews()
        self.setConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.contentView.addSubview(self.imagesView)
        self.contentView.addSubview(self.locationLabel)
        self.contentView.addSubview(self.nameLocationLabel)
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            self.imagesView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            self.imagesView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.imagesView.widthAnchor.constraint(equalToConstant: 64),
            self.imagesView.heightAnchor.constraint(equalToConstant: 64),
            self.locationLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.locationLabel.heightAnchor.constraint(equalToConstant: self.contentView.frame.height / 2),
            self.locationLabel.leftAnchor.constraint(equalTo: self.imagesView.rightAnchor, constant: 10),
            self.nameLocationLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            self.nameLocationLabel.heightAnchor.constraint(equalToConstant: self.contentView.frame.height / 2),
            self.nameLocationLabel.leftAnchor.constraint(equalTo: self.imagesView.rightAnchor, constant: 10)
        ])
    }
    
    func configured(locationLabel: String, nameLocation: String) {
        DispatchQueue.main.async {
            self.locationLabel.text = locationLabel
            self.nameLocationLabel.text = nameLocation
        }
    }
}
