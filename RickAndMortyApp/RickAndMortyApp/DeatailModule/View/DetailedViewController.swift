//
//  DetailedViewController.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 19.08.23.
//

import UIKit

protocol DetailedViewControllerDisplayLogic: AnyObject {
    func displayData(model: DetailsModel, episodes: [InfoEpisodes])
    func setOriginInfo(origin: InfoOrigin)
    func getOrigin()
}

final class DetailedViewController: UIViewController {
    
    var presenter: DetailedViewBusinessLogic?
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(IconTableCell.self, forCellReuseIdentifier: IconTableCell.key)
        table.register(InfoTableCell.self, forCellReuseIdentifier: InfoTableCell.key)
        table.register(OriginTableCell.self, forCellReuseIdentifier: OriginTableCell.key)
        table.register(EpisodesTableCell.self, forCellReuseIdentifier: EpisodesTableCell.key)
        table.allowsSelection = false
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    private lazy var blurView: UIVisualEffectView = {
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blur.frame = self.view.bounds
        return blur
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        activity.color = .darkGray
        activity.center = self.view.center
        activity.hidesWhenStopped = true
        activity.startAnimating()
        return activity
    }()
    
    private var character: InfoCharacters?
    private var episodes: [InfoEpisodes]?
    private var origin: InfoOrigin?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 4.0 / 255.0, green: 12.0 / 255.0, blue: 30.0 / 255.0 , alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.addCustomBackButton(title: "")
        
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.tableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
        self.presenter?.getCharacterById()
    }
}

extension DetailedViewController: DetailedViewControllerDisplayLogic {
    // Обновление  данных экрана
    func displayData(model: DetailsModel, episodes: [InfoEpisodes]) {
        
        self.character = model.character
        self.episodes = episodes
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    // Получение и установка информации о локации
    func setOriginInfo(origin: InfoOrigin) {
        self.origin = origin
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func getOrigin() {
        if let url = self.character?.origin.url, let location = self.character?.location.url {
            if url == "" {
                self.presenter?.getInfoOrigin(url: location)
            } else {
                self.presenter?.getInfoOrigin(url: url)
            }
        }
    }
}

// MARK: UITableViewDelegate
extension DetailedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 230
        } else if indexPath.section == 1 {
            return 50
        } else {
            return 74
        }
    }
}

// MARK: UITableViewDataSource
extension DetailedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if let character = self.character {
            return character.episode.count + 3
        }
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = ContentType(rawValue: section)
        switch key {
        case .info:
            return 3
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let key = ContentType(rawValue: indexPath.section)
        switch key {
        case .icon:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: IconTableCell.key) as? IconTableCell {
                DispatchQueue.global().async {
                    guard let url = self.character?.image, let name = self.character?.name, let status = self.character?.status, let image = self.presenter?.getImagebyURL(url: url) else { return }
                    cell.configured(name: name, status: status, image: image)
                }
                return cell
            }
        case .info:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: InfoTableCell.key) as? InfoTableCell {
                guard let species = self.character?.species, let type = self.character?.type, let gender = self.character?.gender else { return  UITableViewCell()}
                if indexPath.row == 0 {
                    cell.configured(info: "Species:", value: species)
                } else if indexPath.row == 1 {
                    cell.configured(info: "Type:", value: type)
                } else {
                    cell.configured(info: "Gender:", value: gender)
                }
                return cell
            }
        case.origin:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: OriginTableCell.key) as? OriginTableCell {
                DispatchQueue.global().async {
                    guard let location = self.origin?.name, let name = self.origin?.type else { return }
                    cell.configured(locationLabel: location, nameLocation: name)
                }
                
                return cell
            }
        default:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: EpisodesTableCell.key) as? EpisodesTableCell {
                guard let episodes = episodes else { return UITableViewCell()}
                let index = indexPath.section - 3
                cell.configured(nameEpisode: episodes[index].name, infoEpisode: episodes[index].episode, dateEpisode: episodes[index].airDate)
                    self.activityIndicator.removeFromSuperview()
                    self.blurView.removeFromSuperview()
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key = ContentType(rawValue: section)
        switch key {
        case .info:
            return ContentType.info.description
        case .origin:
            return ContentType.origin.description
        case .episodes:
            return ContentType.episodes.description
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .white
        header.textLabel?.font = UIFont(name: "", size: 17)
    }
}
