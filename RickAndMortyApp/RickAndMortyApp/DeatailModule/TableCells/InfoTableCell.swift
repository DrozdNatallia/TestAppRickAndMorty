//
//  InfoTableCell.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 19.08.23.
//

import UIKit

final class InfoTableCell: UITableViewCell {
    static let key = "InfoTableCell"
    
    private lazy var nameInfoLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.layer.cornerRadius = 15
        lbl.layer.masksToBounds = true
        lbl.backgroundColor = .clear
        lbl.textAlignment = .left
        lbl.textColor = UIColor(red: 196.0 / 255.0, green: 201.0 / 255.0, blue: 206.0 / 255.0, alpha: 1.0)
        lbl.font = lbl.font.withSize(16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var valueLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.layer.cornerRadius = 15
        lbl.layer.masksToBounds = true
        lbl.backgroundColor = .clear
        lbl.textAlignment = .right
        lbl.textColor = .white
        lbl.font = lbl.font.withSize(16)
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
        self.contentView.addSubview(self.nameInfoLabel)
        self.contentView.addSubview(self.valueLabel)
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            self.nameInfoLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.nameInfoLabel.widthAnchor.constraint(equalToConstant: self.contentView.frame.width / 2 - 5),
            self.nameInfoLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            self.nameInfoLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            self.valueLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.valueLabel.widthAnchor.constraint(equalToConstant: self.contentView.frame.width / 2 - 5),
            self.valueLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            self.valueLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5)
        ])
    }
    
    func configured(info: String, value: String) {
        if value == "" {
            self.valueLabel.text = "None"
        } else {
            self.valueLabel.text = value
        }
        self.nameInfoLabel.text = info
    }
}
