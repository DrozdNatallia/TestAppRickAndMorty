//
//  EpisodesTableCell.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 19.08.23.
//

import UIKit

final class EpisodesTableCell: UITableViewCell {
    static let key = "EpisodesTableCell"
    
    private lazy var nameEpisodeLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = lbl.font.withSize(22)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    private lazy var infoEpisodeLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        lbl.textAlignment = .center
        lbl.textColor = UIColor(red: 71.0 / 255.0, green: 198.0 / 255.0, blue: 11.0 / 255.0 , alpha: 1.0)
        lbl.font = lbl.font.withSize(13)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        lbl.textAlignment = .center
        lbl.textColor = UIColor(red: 147.0 / 255.0, green: 152.0 / 255.0, blue: 156.0 / 255.0 , alpha: 1.0)
        lbl.font = lbl.font.withSize(12)
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
        self.contentView.addSubview(self.nameEpisodeLabel)
        self.contentView.addSubview(self.infoEpisodeLabel)
        self.contentView.addSubview(self.dateLabel)
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            self.nameEpisodeLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.nameEpisodeLabel.heightAnchor.constraint(equalToConstant: self.contentView.frame.height / 2),
            self.nameEpisodeLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            
            self.infoEpisodeLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            self.infoEpisodeLabel.heightAnchor.constraint(equalToConstant: self.contentView.frame.height / 2),
            self.infoEpisodeLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            
            self.dateLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            self.dateLabel.heightAnchor.constraint(equalToConstant: self.contentView.frame.height / 2),
            self.dateLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10),
        ])
    }
    
    func configured(nameEpisode: String, infoEpisode: String, dateEpisode: String) {
        let fullNameEpisode = self.convertEpisode(shortName: infoEpisode)
        self.nameEpisodeLabel.text = nameEpisode
        self.infoEpisodeLabel.text = fullNameEpisode
        self.dateLabel.text = dateEpisode
    }
    
    
    private func convertEpisode(shortName: String) -> String {
        let name = shortName.components(separatedBy: "E")
        let numSeason = name[0].filter { "0"..."9" ~= $0 }
        let numEpisode = name[1]
        if let season = Int(numSeason), let episode = Int(numEpisode) {
            return "Episode: \(episode), Season: \(season)"
        }
        return ""
    }
}
