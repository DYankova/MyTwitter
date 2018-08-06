//
//  Cells.swift
//  MyTwitter
//
//  Created by Dilyana Yankova on 7/23/18.
//  Copyright © 2018 Dilyana Yankova. All rights reserved.
//

import LBTAComponents

let twitterBlue = UIColor(r: 61, g: 167, b: 244)

class UserFooter: DatasourceCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = twitterBlue
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false //separator
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right:  rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 14, rightConstant: 0,widthConstant: 0,heightConstant: 0)
    }
}

class UserHeader: DatasourceCell {
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Who to follow"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false //separator
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        addSubview(textLabel)
//        textLabel.fillSuperview() //fill the entire super view
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right:  rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0,widthConstant: 0,heightConstant: 0)
    }
}


