//
//  WordCell.swift
//  MyTwitter
//
//  Created by Dilyana Yankova on 7/23/18.
//  Copyright © 2018 Dilyana Yankova. All rights reserved.
//

import UIKit
class WordCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let wordLabel: UILabel = {
        let label = UILabel()
        label.text = "bla"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

    }()
    
    func setupViews(){
        backgroundColor = UIColor.yellow
        addSubview(wordLabel)
        wordLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        wordLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        wordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
