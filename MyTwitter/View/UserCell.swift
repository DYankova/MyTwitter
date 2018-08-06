//
//  UserCell.swift
//  MyTwitter
//
//  Created by Dilyana Yankova on 7/24/18.
//  Copyright © 2018 Dilyana Yankova. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell {
    override var datasourceItem: Any? {
        didSet {
            //downct this datasource as User object
            guard let user =  datasourceItem as? User else {return}
            nameLabel.text = user.name
            userNameLabel.text = user.username
            bioTextView.text = user.bioText
            profileImageView.loadImage(urlString: user.profileImageUrl)
        }
    }
    
    let bioTextView: UITextView = {
        let textview = UITextView()
        textview.text = "Swift development "
        textview.font = UIFont.systemFont(ofSize: 15)
        textview.backgroundColor = .clear
        return textview
    }()
    
    let profileImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Dilyana Yankova"
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "@buildtwitter"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        return label
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = twitterBlue.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(twitterBlue, for: .normal)
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = twitterBlue
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        separatorLineView.isHidden = false //separator
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        addSubview(nameLabel)
        addSubview(userNameLabel)
        addSubview(bioTextView)
        addSubview(profileImageView)
        addSubview(followButton)
        
        profileImageView.anchor(self.topAnchor , left: self.leftAnchor, bottom: nil , right: nil ,topConstant: 12 , leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        userNameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(userNameLabel.bottomAnchor, left: userNameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor,topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0
        )
        followButton.anchor(topAnchor, left: nil,bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12,widthConstant: 120, heightConstant: 34)
    
    }}
