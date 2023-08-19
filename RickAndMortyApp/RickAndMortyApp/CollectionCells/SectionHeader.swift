//
//  SectionHeader.swift
//  RickAndMortyApp
//
//  Created by Natalia Drozd on 18.08.23.
//

import UIKit
import SnapKit

class SectionHeader: UICollectionReusableView {
    
    static let reuseId = "SectionHeader"
    
    private lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 55, weight: .semibold)
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.text = "Characters"
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(self.title)
        
        self.title.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
